import 'package:app/model/services/storage_service.dart';
import 'package:app/model/view_model/base_vm.dart';
import 'package:app/pages/verify_email_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:app/util/validation.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key, required this.email, required this.register});

  final String email;
  final bool register;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final BaseViewModel _vm = BaseViewModel();
  final StorageService _storageService = StorageService();
  final _formKey = GlobalKey<FormState>();
  final _passwordController1 = TextEditingController();

  final _passwordController2 = TextEditingController();

  bool _validPassword = false;

  bool _passwordsFilled = false;

  bool _showPassword1 = false;
  bool _showPassword2 = false;

  @override
  void dispose() {
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: CustomColors.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.register
                      ? 'Sichere dein Konto mit einem Passwort'
                      : 'Login',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: _passwordController1,
                  autocorrect: false,
                  autofocus: true,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_showPassword1,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword1 = !_showPassword1;
                          });
                        },
                        icon: Icon(_showPassword1
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined)),
                    label: const Text('Passwort'),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || !value.isValidPassword) {
                      _validPassword = false;
                      return 'Mindestens 12 Zeichen, Zahlen, Sonderzeichen (-_?!=.,*+), Groß- & Kleinbuchstaben';
                    } else {
                      if (!widget.register) {
                        _passwordsFilled = true;
                      }
                      _validPassword = true;
                      return null;
                    }
                  },
                  onChanged: (value) {
                    _formKey.currentState?.validate();
                    if (!value.isValidPassword) {
                      setState(() {
                        _validPassword = false;
                      });
                    } else {
                      setState(() {
                        if (!widget.register) {
                          _passwordsFilled = true;
                        }
                        _validPassword = true;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: !widget.register || !_validPassword
                      ? null
                      : TextFormField(
                          controller: _passwordController2,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_showPassword2,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showPassword2 = !_showPassword2;
                                  });
                                },
                                icon: Icon(_showPassword2
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined)),
                            label: const Text('Passwort bestätigen'),
                            filled: true,
                          ),
                          validator: (value) {
                            if (_passwordController1.text !=
                                _passwordController2.text) {
                              setState(() {
                                _passwordsFilled = false;
                              });
                              return 'Passwörter stimmen nicht überein';
                            } else {
                              setState(() {
                                _passwordsFilled = true;
                              });
                              return null;
                            }
                          },
                          onTap: () => _formKey.currentState?.validate(),
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            if (_passwordController1.text !=
                                _passwordController2.text) {
                              setState(() {
                                _passwordsFilled = false;
                              });
                            } else {
                              setState(() {
                                _passwordsFilled = true;
                              });
                            }
                          },
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: !_passwordsFilled ||
                          (widget.register &&
                              _passwordController1.text !=
                                  _passwordController2.text)
                      ? null
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.primary,
                          ),
                          onPressed: _validPassword && _passwordsFilled
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    final navigator = Navigator.of(context);
                                    bool loggedin = false;
                                    if (widget.register) {
                                      loggedin = await _vm.createAccount(
                                        context,
                                        email: widget.email,
                                        password: _passwordController1.text,
                                      );
                                    } else {
                                      loggedin = await _vm.login(
                                        context,
                                        email: widget.email,
                                        password: _passwordController1.text,
                                      );
                                    }
                                    if (loggedin && mounted) {
                                      await _storageService.setAccountLevel(4);
                                      navigator.push(
                                        MaterialPageRoute(
                                          builder: (builder) =>
                                              const VerifyEmailPage(),
                                        ),
                                      );
                                    }
                                  }
                                }
                              : null,
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.register
                                      ? 'Registrierung abschließen'
                                      : 'Einloggen',
                                  style: const TextStyle(
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
          ),
        ),
      ),
    );
  }
}
