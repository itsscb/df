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
    return Container(
      decoration: const BoxDecoration(
        // color: Color.fromARGB(230, 255, 255, 255),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: DecorationImage(
          image: AssetImage(
            'lib/assets/hero-pattern-300x200.png',
            // color: Colors.grey,
          ),
          repeat: ImageRepeat.repeat,
          fit: BoxFit.contain,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Image.asset(
            'lib/assets/logo_300x200.png',
            height: 80,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              tooltip: 'Menu',
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.login_sharp),
            //   tooltip: 'Login',
            // ),
          ],
        ),
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
      ),
    );
  }
}
