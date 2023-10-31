import 'dart:developer';

import 'package:app/data/database.dart';
import 'package:app/pb/account.pb.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/rpc_get_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/rpc_refresh_token.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

class GClient {
  GClient() {
    _init();
  }

  String baseUrl = 'localhost';
  int port = 9090;

  Map<String, String> metadata = {'Authorization': ''};

  late Session session;
  Account? account;

  static Future<GClient> get client async {
    Session s = await Session.session;
    GClient c = GClient();
    c.session = s;
    final sessions = await c.session.getSessions();
    if (sessions.isNotEmpty) {
      c.session = sessions[0];
    }
    print('ACCESS_TOKEN: ${c.session.accessToken}');
    return c;
  }

  dfClient stub = dfClient(
    ClientChannel('10.0.2.2',
        port: 9090,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        )),
    options: CallOptions(
      timeout: const Duration(seconds: 5),
    ),
  );
  Future<void> main(List<String> args) async {}

  void _init() async {
    session = await Session.session;

    final sessions = await session.getSessions();
    if (sessions.isNotEmpty) {
      session = sessions[0];
    }
  }

  Future<CreateAccountResponse> createAccount(
      {required String email,
      required String password,
      required Function({GrpcError? error}) onError}) async {
    try {
      final response = await stub.createAccount(CreateAccountRequest(
        email: email,
        password: password,
      ));
      account = response.account;
      return response;
    } on GrpcError catch (err) {
      onError(error: err);
      print('GRPC ERROR: ${err.message}');
    } catch (err) {
      print('ERROR: $err');
    }
    return CreateAccountResponse();
  }

  Future<LoginResponse> login(
      {required String email,
      required String password,
      required Function({GrpcError? error}) onError,
      required Function onSuccess}) async {
    LoginResponse response = LoginResponse();
    try {
      response = await stub.login(LoginRequest(
        email: email,
        password: password,
      ));
      session.accessToken = response.accessToken;
      session.accountId = response.accountId;
      session.sessionId = response.sessionId;
      session.refreshToken = response.refreshToken;
      session.accessTokenExpiresAt = response.accessTokenExpiresAt;
      session.refreshTokenExpiresAt = response.refreshTokenExpiresAt;
      try {
        session.insertSession(session);
      } catch (err) {}
      metadata['Authorization'] = 'Bearer ${response.accessToken}';
      onSuccess();
      return response;
    } on GrpcError catch (err) {
      print('caught error: ${err.message}');
      metadata['Authorization'] = '';
      onError(error: err);
    } catch (err) {
      print('caught error: $err');
      metadata['Authorization'] = '';
      onError();
    }
    return response;
  }

  bool get isLoggedIn =>
      session.accessTokenExpiresAt != null &&
      session.accessTokenExpiresAt!.toDateTime().isAfter(DateTime.now());

  Future<void> resetSession() async {
    session.reset();
    account = Account();
    session = await Session.session;
  }

  Future<bool> refreshToken() async {
    try {
      final response = await stub.refreshToken(
        RefreshTokenRequest(
          refreshToken: session.refreshToken,
        ),
      );
      session.accessToken = response.accessToken;
      session.insertSession(session);
      return true;
    } on GrpcError catch (err) {
      print('caught grpc error: $err');
    }
    return false;
  }

  Future<GetAccountResponse> getAccount(
      {required Int64 accountId,
      required Function({GrpcError? err}) onError}) async {
    GetAccountResponse response = GetAccountResponse();
    try {
      response = await stub.getAccount(GetAccountRequest(
        id: accountId,
      ));
      account = response.account;
    } on GrpcError catch (err) {
      if (err.code == 16) {
        log(err.toString());
        onError(err: err);
      } else {
        log(err.toString());
        onError();
      }
    } catch (err) {
      log(err.toString());
      onError();
    }
    return response;
  }

  Future<GetAccountInfoResponse> getAccountInfo(GetAccountInfoRequest request,
      {required Function({String msg}) onError}) async {
    GetAccountInfoResponse response = GetAccountInfoResponse();
    try {
      print('SENDING REQ: $request WITH $metadata');
      response = await stub.getAccountInfo(
        request,
        options: CallOptions(
          metadata: {'Authorization': 'Bearer ${session.accessToken}'},
        ),
      );
      return response;
    } on GrpcError catch (err) {
      print('caught grpc error: ${err.message} [${err.code}]');
      if (err.code == 16) {
        onError(msg: 'Sitzung ist abgelaufen.\nBitte loggen Sie sich neu ein.');
      } else {
        onError(msg: err.message != null ? err.message! : 'Interner Fehler');
      }
    } catch (err) {
      print('caught error: $err');
      onError(msg: err.toString());
    }
    return response;
  }
}
