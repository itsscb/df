import 'package:app/data/database.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/rpc_refresh_token.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GClient {
  GClient() {
    _init();
  }

  String baseUrl = 'localhost';
  int port = 9090;

  Map<String, String> metadata = {'Authorization': ''};

  late Session session;

  static Future<GClient> get client async {
    Session s = await Session.newSession;
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
    session = await Session.newSession;

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
      return response;
    } on GrpcError catch (e) {
      onError(error: e);
      print('GRPC ERROR: ${e.message}');
    } catch (e) {
      print('ERROR: $e');
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
    } on GrpcError catch (e) {
      print('caught error: ${e.message}');
      metadata['Authorization'] = '';
      onError(error: e);
    } catch (e) {
      print('caught error: $e');
      metadata['Authorization'] = '';
      onError();
    }
    return response;
  }

  bool get isLoggedIn =>
      session.accessTokenExpiresAt != null &&
      session.accessTokenExpiresAt!.toDateTime().isAfter(DateTime.now());

  Future<void> resetSession() async {
    if (session.sessionId != null) {
      session.removeSession(session.sessionId!);
    }
    session = await Session.newSession;
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
    } on GrpcError catch (e) {
      print('caught grpc error: $e');
    }
    return false;
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
    } on GrpcError catch (e) {
      print('caught grpc error: ${e.message} [${e.code}]');
      if (e.code == 16) {
        onError(msg: 'Sitzung ist abgelaufen.\nBitte loggen Sie sich neu ein.');
      } else {
        onError(msg: e.message != null ? e.message! : 'Interner Fehler');
      }
    } catch (e) {
      print('caught error: $e');
      onError();
    }
    return response;
  }
}
