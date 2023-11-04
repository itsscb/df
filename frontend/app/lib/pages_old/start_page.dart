import 'package:app/gapi/client.dart';
import 'package:app/model/apis/api_response.dart';
import 'package:app/model/view_model/account_vm.dart';
import 'package:app/pages_old/dashboard_page.dart';
import 'package:app/pages_old/login_page.dart';
import 'package:app/pages_old/register_page.dart';
import 'package:app/pb/account.pb.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_bar.dart';
import 'package:app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StartPage extends StatefulWidget {
  const StartPage({
    super.key,
    // required this.client,
  });

  // GClient client;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<BottomNavigationBarItem> bottombarButtons = [];

  // void _updateClient(GClient c) {
  //   setState(() {
  //     widget.client = c;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  SnackBar _snackBar(BuildContext context, String message, String label,
      void Function() action) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // ScaffoldMessenger.of(context).clearSnackBars();
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      action: SnackBarAction(
        label: label,
        onPressed: action,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: ChangeNotifierProvider<AccountViewModel>(
        create: (context) => AccountViewModel(),
        child: Consumer<AccountViewModel>(builder: (context, value, child) {
          return Scaffold(
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
                    value.logout();
                    // ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      _snackBar(
                        context,
                        value.response.message != null
                            ? value.response.message!
                            : value.response.status.toString(),
                        value.response.status.toString(),
                        () {
                          print('asdf');
                        },
                      ),
                    );
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
                children: value.response.data != null
                    ? [
                        BottomNavigationBarItem(
                          backgroundColor: Colors.white,
                          label: 'Personen',
                          icon: Column(
                            children: [
                              IconButton(
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              const LoginPage()));
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
            body: Column(
              children: [
                if (value.response.status == Status.COMPLETED &&
                    value.response.data != null &&
                    !(value.response.data as Account).emailVerified)
                  Card(
                    color: Colors.orange,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'E-Mail ist noch nicht verifiziert.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sans-serif',
                                fontSize: 14),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.restore,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
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
                        'Digitale Spuren auf Knopfdruck entfernen'
                            .toUpperCase(),
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
                            // ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              _snackBar(
                                context,
                                value.response.message != null
                                    ? value.response.message!
                                    : value.response.status.toString(),
                                value.response.status.toString(),
                                () {
                                  print('asdf');
                                },
                              ),
                            );
                          },
                          child: const Text('asdf'))
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
