import 'package:app/gapi/client.dart';
import 'package:app/pb/rpc_create_account.pb.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  Client client = Client();

  void test() {
    client.stub.createAccount(
      CreateAccountRequest(email: "dev@itsscb.de", password: "secret-key123"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                test();
              },
              child: const Text('Button'))
        ],
      ),
    );
  }
}
