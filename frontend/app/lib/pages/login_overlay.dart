import 'package:app/model/view_model/base_vm.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:app/widgets/bottom_navigation_item.dart';
import 'package:app/widgets/side_drawer.dart';
import 'package:app/widgets/side_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:app/util/validation.dart';
import 'package:provider/provider.dart';

Future<bool> showLogin(BuildContext context,
    {bool registration = false}) async {
  final formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  BaseViewModel vm = BaseViewModel();
  bool submitted = false;
  bool loggedin = false;
  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      submitted = true;
      FocusScope.of(context).unfocus();
      vm
          .login(context,
              email: mailController.text, password: passwordController.text)
          .then(
        (r) {
          if (r) {
            loggedin = r;
            Navigator.pop(context, true);
          }
        },
      );
      passwordController.clear();
      submitted = false;
    }
  }

  void register(BuildContext context) {
    if (formKey.currentState!.validate()) {
      submitted = true;
      vm
          .createAccount(
        context,
        email: mailController.text,
        password: passwordController.text,
      )
          .then(
        (r) {
          if (r) {
            loggedin = r;
            Navigator.pop(context, true);
          }
        },
      );
    }
  }

  await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      context: context,
      builder: (builder) {
        return Background(
          child: Scaffold(
            drawer: SideDrawer(
              children: [
                const Spacer(
                  flex: 3,
                ),
                SideDrawerItem(
                  onPressed: () {},
                  icon: Icons.question_answer,
                  color: Colors.white,
                  label: 'About',
                ),
                SideDrawerItem(
                  onPressed: () {},
                  icon: Icons.privacy_tip,
                  color: Colors.white,
                  label: 'Datenschutz',
                ),
                SideDrawerItem(
                  onPressed: () {},
                  icon: Icons.apartment,
                  color: Colors.white,
                  label: 'Impressum',
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigation(
              children: [
                BottomNavigationItem(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icons.arrow_back,
                  color: Colors.white,
                  label: 'Zurück',
                ),
                BottomNavigationItem(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icons.home,
                  color: Colors.white,
                  label: 'Home',
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Text(
                    registration ? 'Registrieren' : 'Login',
                    style: const TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 6,
                    ),
                  ),
                  ChangeNotifierProvider<BaseViewModel>(
                    create: (context) => BaseViewModel(),
                    child: Consumer<BaseViewModel>(
                      builder: (context, value, child) => Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              // autofocus: true,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.allow(
                              //     emailRegExp,
                              //   ),
                              // ],
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
                                if (value == null || !value.isValidEmail) {
                                  return 'Bitte eine gültige E-Mail Adresse eingeben';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.allow(
                              //     passwordRegExp,
                              //   ),
                              // ],
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
                                if (value == null || !value.isValidPassword) {
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
                                  onPressed: !submitted
                                      ? !registration
                                          ? () {
                                              login(context);
                                            }
                                          : () {
                                              register(context);
                                            }
                                      : null,
                                  child: const Icon(Icons.login),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      });
  return loggedin;
}
