import 'package:app/data/database.dart';
import 'package:fixnum/fixnum.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GClient {
  GClient() {
    // session = Session.newSession();
    _init();
  }

  String baseUrl = 'localhost';
  int port = 9090;

  Map<String, String> metadata = {'Authorization': ''};
  // String accessToken = '';
  // Int64 accountId = Int64();

  late Session session;

  static Future<GClient> get client async {
    Session s = await Session.newSession;
    GClient c = GClient();
    c.session = s;
    final sessions = await c.session.getSessions();
    c.session = sessions[0];
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
    // print('CLIENT: INITIALIZING CLIENT - start');

    session = await Session.newSession;
    // print('CLIENT: getting sessions from database');

    final sessions = await session.getSessions();
    print('CLIENT: got sessions from database: ${sessions.toString()}');
    session = sessions[0];
    // print('CLIENT: INITIALIZING CLIENT - end');
    print(session.toString());
  }

  Future<CreateAccountResponse> createAccount(
      CreateAccountRequest request) async {
    try {
      final response = stub.createAccount(request);
      return response;
    } catch (e) {
      print('caught error: $e');
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
      print(response);
      session.accessToken = response.accessToken;
      session.accountId = response.accountId;
      session.sessionId = response.sessionId;
      session.refreshToken = response.refreshToken;
      session.accessTokenExpiresAt = response.accessTokenExpiresAt;
      session.refreshTokenExpiresAt = response.refreshTokenExpiresAt;
      print('GOT: ${session.toString()}');
      try {
        session.insertSession(session);
      } catch (err) {
        print('ERROR WRITING DB: $err');
      }
      metadata['Authorization'] = 'Bearer ${response.accessToken}';
      print('auth: ${metadata['Authorization']}');
      onSuccess();
      // return response;
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

  Future<GetAccountInfoResponse> getAccountInfo(GetAccountInfoRequest request,
      {required Function onError}) async {
    try {
      // Map<String, String> metadata = {'Authorization': 'Bearer $token'};
      final response = await stub.getAccountInfo(
        request,
        options: CallOptions(
          metadata: metadata,
        ),
      );
      return response;
    } on GrpcError catch (e) {
      print('caught error: ${e.message}');
      onError();
    } catch (e) {
      print('caught error: $e');
      onError();
    }
    return GetAccountInfoResponse();
  }
}
