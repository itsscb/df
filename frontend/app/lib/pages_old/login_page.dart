import 'package:app/model/services/backend_service.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_bar.dart';
import 'package:app/widgets/loading_widget.dart';
import 'package:app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

// GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    // required this.client,
    // required this.onChangePage,
  });

  // final GClient client;
  // void Function(Pages page) onChangePage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  final List<BottomNavigationBarItem> bottombarButtons = [];

  // List<BottomNavigationBarItem> _selectedBottomBarButtons = bottomBarButtons;
  @override
  void initState() {
    super.initState();
    _addBottomBarButtons();
  }

  void _addBottomBarButtons() {
    bottombarButtons.addAll([
      const BottomNavigationBarItem(
        label: 'back',
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        label: 'Menu',
        icon: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  // final GClient client = GClient();

  final _formKey = GlobalKey<FormState>();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // flexibleSpace: Image.asset(
          //   'lib/assets/logo_300x200.png',
          //   height: 80,
          // ),
        ),
        bottomNavigationBar: BottomBar(
          children: [
            BottomNavigationBarItem(
              label: 'back',
              backgroundColor: Colors.white,
              icon: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              label: 'Menu',
              icon: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        drawer: SideDrawer(children: [
          const Spacer(),
          TextButton(
            onPressed: () {
              Scaffold.of(context).closeDrawer();
            },
            child: const Row(
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Icon(
                  Icons.question_answer,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Scaffold.of(context).closeDrawer();
            },
            child: const Row(
              children: [
                Text(
                  'Datenschutz',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Icon(
                  Icons.privacy_tip,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Scaffold.of(context).closeDrawer();
            },
            child: const Row(
              children: [
                Text(
                  'Impressum',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Icon(
                  Icons.apartment,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 250,
          )
        ]),
        body: !_loading
            ? Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // final navigator = Navigator.of(context);
                                _setLoading(true);
                                BackendService.login(
                                  email: mailController.text,
                                  password: passwordController.text,
                                ).then(
                                  (r) {
                                    if (r) {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      // Navigator.pushAndRemoveUntil(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (ctx) => const StartPage(
                                      //         // client: widget.client,
                                      //         ),
                                      //   ),
                                      //   (ctx) => false,
                                      // );
                                      // widget.onChangePage(
                                      //   Pages.dashboard,
                                      // );
                                    }
                                    // _setLoading(false);
                                  },
                                );
                              }
                            },
                            child: const Icon(Icons.login))
                      ],
                    ),
                  ),
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }
}
