import 'package:app/gapi/client.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class StartPage extends StatefulWidget {
  StartPage({
    super.key,
    this.client,
  });

  GClient? client;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // List<BottomNavigationBarItem> _selectedBottomBarButtons = bottomBarButtons;
  final List<BottomNavigationBarItem> bottombarButtons = [];

  void _init() async {
    widget.client ??= await GClient.client;
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        drawer: const SideDrawer(),
        bottomNavigationBar: BottomBar(widget: widget),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(
                  'lib/assets/logo_300x200.png',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Digitale Spuren auf Knopfdruck entfernen'.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 24,
                  height: 1.6,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 6,
                ),
              ),
              TextButton(
                onPressed: () {
                  final s = widget.client?.session.getSessions();
                  print(s);
                  print(widget.client?.session.accessToken);
                },
                child: const Text(
                  "GET SESSIONS",
                ),
              ),
              // const Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: widget.client?.accessToken == null
              //       ? [
              // ElevatedButton.icon(
              //   label: const Text('Login'),
              //   onPressed: () {
              //     // onChangePage(Pages.login);
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: ((context) => LoginPage()),
              //       ),
              //     );
              //   },
              //   icon: const Icon(
              //     Icons.login,
              //     semanticLabel: 'Login',
              //     size: 16,
              //   ),
              // ),
              //   ElevatedButton.icon(
              //     label: const Text('Registrieren'),
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.person_add,
              //       semanticLabel: 'Register',
              //       size: 16,
              //     ),
              //   ),
              // ]
              // : [],
              // ),
              // const SizedBox(
              //   height: 38,
              // ),

              // const Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.widget,
  });

  final StartPage widget;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // onTap: (value) => _bottomBarAction(value),
      items: widget.client?.session.accessToken != null
          ? [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: 'Personen',
                icon: Column(
                  children: [
                    IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Personen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
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
              )
            ]
          : [
              BottomNavigationBarItem(
                label: 'register',
                backgroundColor: Colors.white,
                icon: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      icon: const Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Registrieren',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: 'login',
                backgroundColor: Colors.white,
                icon: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      icon: const Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
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
      backgroundColor: Colors.black,
      fixedColor: Colors.black,
    );
  }
}
