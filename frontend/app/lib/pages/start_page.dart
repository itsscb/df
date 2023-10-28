import 'package:app/gapi/client.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'dart:core';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

List<BottomNavigationBarItem> bottomBarButtons = [
  const BottomNavigationBarItem(
    label: 'register',
    backgroundColor: Colors.white,
    icon: Column(
      children: [
        Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        Text(
          'Registrieren',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        )
      ],
    ),
  ),
  const BottomNavigationBarItem(
    label: 'login',
    backgroundColor: Colors.white,
    icon: Column(
      children: [
        Icon(
          Icons.login,
          color: Colors.white,
        ),
        Text(
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
      onPressed: () => scaffoldKey.currentState!.openDrawer(),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),
  ),
];

class StartPage extends StatefulWidget {
  StartPage({
    super.key,
    this.client,
  });

  final GClient? client;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<BottomNavigationBarItem> _selectedBottomBarButtons = bottomBarButtons;

  void _bottomBarAction(int index) {
    switch (_selectedBottomBarButtons[index].label?.toLowerCase()) {
      case 'login':
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // flexibleSpace: Image.asset(
          //   'lib/assets/logo_300x200.png',
          //   height: 80,
          // ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    scaffoldKey.currentState!.closeDrawer();
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
                    scaffoldKey.currentState!.closeDrawer();
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
                    scaffoldKey.currentState!.closeDrawer();
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _bottomBarAction(value),
          items: bottomBarButtons,
          backgroundColor: Colors.black,
          fixedColor: Colors.black,
        ),
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
