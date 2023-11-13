import 'dart:io';

import 'package:app/model/apis/app_exception.dart';
import 'package:app/model/services/storage_service.dart';
import 'package:app/pb/account.pb.dart';
import 'package:app/pb/account_info.pb.dart';
import 'package:app/pb/google/protobuf/timestamp.pb.dart';
import 'package:app/pb/person.pb.dart';
import 'package:app/data/database.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/rpc_create_person.pb.dart';
import 'package:app/pb/rpc_get_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_get_person.pb.dart';
import 'package:app/pb/rpc_list_persons.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/rpc_refresh_token.pb.dart';
import 'package:app/pb/rpc_resend_verification.pb.dart';
import 'package:app/pb/rpc_update_person.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

class BackendService {
  BackendService() {
    _init();
  }
  final String baseUrl = '10.0.0.2';
  final String port = '9090';

  final StorageService _storageService = StorageService();

  late Session _session;

  final dfClient _client = dfClient(
    ClientChannel('10.0.2.2',
        port: 9090,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        )),
    options: CallOptions(
      timeout: const Duration(seconds: 5),
    ),
  );

  static get client => dfClient(
        ClientChannel('10.0.2.2',
            port: 9090,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            )),
        options: CallOptions(
          timeout: const Duration(seconds: 5),
        ),
      );

  void _init() {
    Session.session.then((value) => _session = value);
  }

  Future<Session?> _isLoggedIn() async {
    Session session = await Session.session;
    if (session.accessToken == null ||
        session.refreshToken == null ||
        session.accountId == null) {
      return null;
    }

    if (session.accessTokenExpiresAt == null) {
      return null;
    }

    if (session.refreshTokenExpiresAt == null) {
      return null;
    }

    if (session.refreshTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      return null;
    } else {
      if (session.refreshToken != null &&
          session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
        session = await refreshToken(session);
      }
    }

    return session;
  }

  static Future<bool> get isLoggedIn async {
    Session session = await Session.session;
    if (session.accessToken == null ||
        session.refreshToken == null ||
        session.accountId == null) {
      return false;
    }

    if (session.accessTokenExpiresAt == null) {
      await logout();
      return false;
    }

    if (session.refreshTokenExpiresAt == null) {
      await logout();
      return false;
    }

    if (session.refreshTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      await logout();
      return false;
    }

    if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      Session s = await BackendService.refreshToken(session);
      if (s == session) {
        return false;
      }
    }

    return true;
  }

  static Future<Int64?> get accountId async {
    return (await Session.session).accountId;
  }

  Future<bool> createAccount(
      {required String email, required String password}) async {
    try {
      final resp =
          await BackendService.client.createAccount(CreateAccountRequest(
        email: email,
        password: password,
      ));
      print(resp);
      await _storageService.setAccountId(resp.account.id);
      return await login(email: email, password: password);
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException('${err.message}');
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<bool> resendVerification({required Int64 accountId}) async {
    try {
      final resp = await BackendService.client.resendVerification(
          ResendVerificationRequest(
            accountId: accountId,
          ),
          options: CallOptions(metadata: {
            'Authorization': 'Bearer ${await _storageService.accessToken}'
          }));
      return resp.account.id == accountId;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException('${err.message}');
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<Account> getAccount() async {
    Session? session = await _isLoggedIn();
    if (session == null) {
      throw UnauthorizedException('Sitzung ist abgelaufen');
    }
    try {
      final GetAccountResponse response = await _client.getAccount(
          GetAccountRequest(id: session.accountId),
          options: CallOptions(
              metadata: {'Authorization': 'Bearer ${session.accessToken}'}));
      return response.account;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      if (err.code == 16) {
        throw UnauthorizedException(err.message);
      }
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<AccountInfo> getAccountInfo() async {
    Session session = await Session.session;
    if (session.accessTokenExpiresAt == null) {
      throw UnauthorizedException('Keine Siztung gefunden');
    }
    if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      session = await refreshToken(session);
      if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
        throw UnauthorizedException('Sitzung ist abgelaufen');
      }
    }
    try {
      final GetAccountInfoResponse response = await _client
          .getAccountInfo(GetAccountInfoRequest(accountId: _session.accountId));
      return response.accountInfo;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      if (err.code == 16) {
        await refreshToken(session);
        return getAccountInfo();
      }
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<Person> getPerson(Int64 personId) async {
    Session session = await Session.session;
    if (session.accessTokenExpiresAt == null) {
      throw UnauthorizedException('Keine Siztung gefunden');
    }
    if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      session = await refreshToken(session);
      if (session.accessTokenExpiresAt == null) {
        throw UnauthorizedException('Sitzung ist abgelaufen');
      }
    }
    try {
      final GetPersonResponse response =
          await _client.getPerson(GetPersonRequest(id: personId));
      return response.person;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<Person> updatePerson(
      {required Int64 id,
      String? firstname,
      String? lastname,
      String? street,
      String? zip,
      String? city,
      String? country,
      Timestamp? birthday}) async {
    Session session = await Session.session;
    if (session.accessTokenExpiresAt == null) {
      throw UnauthorizedException('Keine Siztung gefunden');
    }
    if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      session = await refreshToken(session);
      if (session.accessTokenExpiresAt == null) {
        throw UnauthorizedException('Sitzung ist abgelaufen');
      }
    }
    try {
      final UpdatePersonRequest req = UpdatePersonRequest(
        id: id,
      );

      if (lastname != null) {
        req.lastname = lastname;
      }
      if (firstname != null) {
        req.firstname = firstname;
      }
      if (street != null) {
        req.street = street;
      }
      if (city != null) {
        req.city = city;
      }
      if (zip != null) {
        req.zip = zip;
      }
      if (country != null) {
        req.country = country;
      }
      if (birthday != null) {
        req.birthday = birthday;
      }
      final UpdatePersonResponse response = await _client.updatePerson(req,
          options: CallOptions(
              metadata: {'Authorization': 'Bearer ${session.accessToken}'}));
      return response.person;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<Person> createPerson(
      {required String firstname,
      required String lastname,
      required String street,
      required String zip,
      required String city,
      required String country,
      required Timestamp birthday}) async {
    Session session = await Session.session;
    if (session.accessTokenExpiresAt == null) {
      throw UnauthorizedException('Keine Siztung gefunden');
    }
    if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      session = await refreshToken(session);
      if (session.accessTokenExpiresAt == null) {
        throw UnauthorizedException('Sitzung ist abgelaufen');
      }
    }
    try {
      final CreatePersonRequest req = CreatePersonRequest(
        accountId: session.accountId,
        lastname: lastname,
        firstname: firstname,
        street: street,
        city: city,
        zip: zip,
        country: country,
        birthday: birthday,
      );
      final CreatePersonResponse response = await _client.createPerson(req,
          options: CallOptions(
              metadata: {'Authorization': 'Bearer ${session.accessToken}'}));
      return response.person;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<List<Person>> listPersons() async {
    Session session = await Session.session;
    if (session.accessTokenExpiresAt == null) {
      throw UnauthorizedException('Keine Siztung gefunden');
    }
    if (session.accessTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      session = await refreshToken(session);
      if (session.accessTokenExpiresAt == null) {
        throw UnauthorizedException('Sitzung ist abgelaufen');
      }
    }
    try {
      final ListPersonsResponse response = await _client.listPersons(
          ListPersonsRequest(
            accountId: session.accountId,
          ),
          options: CallOptions(
              metadata: {'Authorization': 'Bearer ${session.accessToken}'}));
      return response.persons;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  // Future<List<Person>> listPersons() async {
  //   if (_session.accessToken == null) {
  //     refreshToken();
  //   }
  //   try {
  //     ListPersonsResponse response =
  //         await _client.listPersons(ListPersonsRequest(accountId: _session.accountId));
  //     return response.persons;
  //   } on SocketException {
  //     throw FetchDataException('Keine Internet Verbindung');
  //   } on GrpcError catch (err) {
  //     throw FetchDataException(err.message);
  //   } catch (err) {
  //     throw InternalException(err.toString());
  //   }
  // }
  Future<bool> login({required String email, required String password}) async {
    try {
      final LoginResponse response = await BackendService.client.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );
      // Session s = Session(
      //   accessToken: response.accessToken,
      //   sessionId: response.sessionId,
      //   accessTokenExpiresAt: response.accessTokenExpiresAt,
      //   refreshToken: response.refreshToken,
      //   refreshTokenExpiresAt: response.refreshTokenExpiresAt,
      //   accountId: response.accountId,
      // );

      await _storageService.setAccessToken(response.accessToken);

      // await Session.newSession(s);
      return response.accessToken != '';
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  static Future<Session> refreshToken(Session session) async {
    try {
      final RefreshTokenResponse response = await BackendService.client
          .refreshToken(
              RefreshTokenRequest(refreshToken: session.refreshToken));
      session.accessToken = response.accessToken;
      session.accessTokenExpiresAt = response.accessTokenExpiresAt;
      session = await Session.updateToken(session);
      return session;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  static Future<void> logout() async {
    Session session = await Session.session;
    session.reset();
  }
}
