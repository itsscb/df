import 'package:app/model/services/backend_service.dart';
import 'package:app/widgets/background.dart';
import 'package:flutter/material.dart';

Future<bool> showLogin(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _loggedin = false;

  await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      context: context,
      builder: (builder) {
        return Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Image(
                width: 180,
                image: AssetImage(
                  'lib/assets/logo_300x200.png',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 24,
                  height: 1.6,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 6,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
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
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BackendService.login(
                                email: mailController.text,
                                password: passwordController.text,
                              ).then(
                                (r) {
                                  if (r) {
                                    _loggedin = r;
                                    Navigator.pop(context, true);
                                  }
                                },
                              );
                            }
                          },
                          child: const Icon(Icons.login),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        );
      });
  return _loggedin;
}
