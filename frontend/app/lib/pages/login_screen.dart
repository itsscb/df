import 'package:app/gapi/client.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/pb/rpc_login.pb.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  Client client = Client();

  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: mailController,
            decoration: const InputDecoration(
              fillColor: Color.fromARGB(30, 255, 255, 255),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.white38,
              ),
              hintText: 'E-Mail Adresse',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bitte eine gültige E-Mail Adresse eingeben';
              }
              return null;
            },
          ),
          TextFormField(
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: passwordController,
            decoration: const InputDecoration(
              fillColor: Color.fromARGB(30, 255, 255, 255),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.white38,
              ),
              hintText: 'Passwort',
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bitte geben Sie Ihr Passwort ein';
              }
              return null;
            },
          ),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // final navigator = Navigator.of(context);
                  LoginResponse response = await client.login(
                    LoginRequest(
                      email: mailController.text,
                      password: passwordController.text,
                    ),
                    onError: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Login fehlgeschlagen'),
                      ));
                    },
                  );

                  print(response);

                  //   GetAccountInfoResponse resp = await client.getAccountInfo(
                  //       GetAccountInfoRequest(accountId: response.accountId));
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeScreen(
                  //         account_info: resp.accountInfo,
                  //       ),
                  //     ),
                  //   );
                }
              },
              child: const Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
