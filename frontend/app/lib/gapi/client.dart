import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

class Client {
  String baseUrl = 'localhost';
  int port = 9090;

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
    // CreateAccountResponse response;
    try {
      final response = stub.createAccount(request);
      return response;
    } catch (e) {
      print('caught error: $e');
    }
    return CreateAccountResponse();
  }
}
