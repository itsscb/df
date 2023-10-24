import 'package:app/main.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:app/pb/service_df.pbgrpc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  // LoginResponse Login(BuildContext context, LoginRequest request ){
  //   try {
  //     final response = stub.login(request);
  //     return response;
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                   content: Text('Login fehlgeschlagen: $e'),
  //                 ));
  //   }
  //   return LoginResponse();

  // }

  Future<LoginResponse> login(LoginRequest request, {Function? onError}) async {
    try {
      final response = await stub.login(request);
      return response;
    } on GrpcError catch (e) {
      print('caught error: ${e.message}');
      onError!();
    } catch (e) {
      print('caught error: $e');
      onError!();
    }
    return LoginResponse();
  }

  Future<GetAccountInfoResponse> getAccountInfo(GetAccountInfoRequest request,
      {Function? onError}) async {
    try {
      final response = await stub.getAccountInfo(request);
      return response;
    } on GrpcError catch (e) {
      print('caught error: ${e.message}');
      onError!();
    } catch (e) {
      print('caught error: $e');
      onError!();
    }
    return GetAccountInfoResponse();
  }
}
