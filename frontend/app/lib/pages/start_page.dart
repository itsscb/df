import 'package:app/gapi/client.dart';
import 'package:app/pages/dashboard_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/register_page.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_bar.dart';
import 'package:app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:core';

// ignore: must_be_immutable
class StartPage extends StatefulWidget {
  StartPage({
    super.key,
    required this.client,
  });

  GClient client;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // List<BottomNavigationBarItem> _selectedBottomBarButtons = bottomBarButtons;
  final List<BottomNavigationBarItem> bottombarButtons = [];

  // void _init() async {
  //   final c = await GClient.client;
  //   setState(() {
  //     widget.client = c;
  //   });
  // }

  void _updateClient(GClient c) {
    setState(() {
      print('GOT CLIENT: $c');
      widget.client = c;
    });
  }

  @override
  void initState() {
    // _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        drawer: Builder(builder: (context) {
          return SideDrawer(children: [
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
            TextButton(
              onPressed: () {
                setState(() {
                  widget.client.session.accessToken = null;
                  widget.client.session
                      .removeSession(widget.client.session.sessionId!);
                });
              },
              child: const Row(
                children: [
                  Text(
                    'Log out',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 250,
            )
          ]);
        }),
        bottomNavigationBar: Builder(builder: (context) {
          return BottomBar(
            // onTap: (value) => _bottomBarAction(value),
            children: widget.client.session.accessToken != null
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
                      label: 'Dashboard',
                      icon: Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              if (!widget.client.isLoggedIn) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Sitzung ist abgelaufen.'),
                                  ),
                                );
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPage(client: widget.client)),
                                    (route) => false);
                              } else {
                                GClient c = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashboardPage(
                                      client: widget.client,
                                    ),
                                  ),
                                );
                                _updateClient(c);
                              }
                            },
                            icon: const Icon(
                              Icons.dashboard,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Dashboard',
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
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
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
                            onPressed: () async {
                              widget.client = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage(
                                            client: widget.client,
                                          )));
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
                            onPressed: () async {
                              final c = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(
                                      client: widget.client,
                                    ),
                                  ));
                              _updateClient(c);
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
          );
        }),
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
            ],
          ),
        ),
      ),
    );
  }
}
