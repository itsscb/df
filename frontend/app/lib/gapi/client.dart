import 'package:fixnum/fixnum.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GClient {
  String baseUrl = 'localhost';
  int port = 9090;

  Map<String, String> metadata = {'Authorization': ''};
  String accessToken = '';
  Int64 accountId = Int64();

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
      accessToken = response.accessToken;
      accountId = response.accountId;
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
