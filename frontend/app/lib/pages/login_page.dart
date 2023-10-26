import 'package:app/gapi/client.dart';
import 'package:app/pages/dashboard_page.dart';
import 'package:app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  final Client client = Client();

  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Image.asset(
          'lib/assets/logo_300x200.png',
          height: 80,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Zurueck',
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'AccountInf',
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: !_loading
          ? Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    // style: TextStyle(
                    //   color: Theme.of(context).colorScheme.primary,
                    // ),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // final navigator = Navigator.of(context);
                          _setLoading(true);
                          client
                              .login(
                            email: mailController.text,
                            password: passwordController.text,
                            onError: () {
                              _setLoading(false);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Login fehlgeschlagen'),
                              ));
                            },
                            onSuccess: () {
                              // _setLoading(false);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Login erfolgreich'),
                              ));
                            },
                          )
                              .then(
                            (r) {
                              if (r.accessToken != '') {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => DashboardPage(
                                        client: client,
                                      ),
                                    ),
                                    (route) => false);
                              }
                              // _setLoading(false);
                            },
                          );
                        }
                      },
                      child: const Icon(Icons.arrow_forward))
                ],
              ),
            )
          : const LoadingWidget(),
    );
  }
}
