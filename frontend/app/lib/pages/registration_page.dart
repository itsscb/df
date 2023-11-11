import 'package:app/pages/password_page.dart';
import 'package:app/util/colors.dart';
import 'package:app/util/validation.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: CustomColors.primary,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Jetzt Registrieren',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'sans-serif',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Gib deine E-Mail Adresse ein.',
                // textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      autofocus: true,
                      controller: mailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        helperText: 'test',
                        label: Text('E-Mail Adresse'),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || !value.isValidEmail) {
                          return 'Bitte eine valide E-Mail Adresse angeben';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => PasswordPage(
                              email: mailController.text,
                              register: false,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Stattdessen anmelden',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.primary,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'flow-button',
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primary,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => PasswordPage(
                                email: mailController.text,
                                register: true,
                              ),
                            ),
                          );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weiter',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}