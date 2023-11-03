import 'dart:io';

import 'package:app/model/apis/app_exception.dart';
import 'package:app/pb/account.pb.dart';
import 'package:app/pb/account_info.pb.dart';
import 'package:app/pb/person.pb.dart';
import 'package:app/data/database.dart';
import 'package:app/pb/rpc_get_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_get_person.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/rpc_refresh_token.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:sqflite/sqflite.dart';

class BackendService {
  BackendService() {
    _init();
  }
  final String baseUrl = '10.0.0.2';
  final String port = '9090';

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
      return false;
    }

    if (session.refreshTokenExpiresAt == null) {
      return false;
    }

    if (session.refreshTokenExpiresAt!.toDateTime().isBefore(DateTime.now())) {
      return false;
    }

    return true;
  }

  Future<Account> getAccount() async {
    Session? session = await _isLoggedIn();
    if (session == null) {
      throw UnauthorizedException('Sitzung ist abgelaufen');
    }
    try {
      final GetAccountResponse response = await _client.getAccount(
          GetAccountRequest(id: session!.accountId),
          options: CallOptions(
              metadata: {'Authorization': 'Bearer ${session.accessToken}'}));
      return response.account;
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      // if (err.code == 16) {
      //   await refreshToken(session);
      //   return getAccount();
      // }
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
  static Future<bool> login(
      {required String email, required String password}) async {
    try {
      final LoginResponse response = await BackendService.client.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );
      await Session.newSession(response as Session);
      return response.accessToken != '';
    } on SocketException {
      throw FetchDataException('Keine Internet Verbindung');
    } on GrpcError catch (err) {
      throw FetchDataException(err.message);
    } catch (err) {
      throw InternalException(err.toString());
    }
  }

  Future<Session> refreshToken(Session session) async {
    try {
      final RefreshTokenResponse response = await _client.refreshToken(
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
