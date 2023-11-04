import 'dart:io';

import 'package:app/model/services/backend_service.dart';
import 'package:app/model/view_model/account_vm.dart';
import 'package:app/pages/login_overlay.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:app/widgets/bottom_navigation_item.dart';
import 'package:app/widgets/drawer.dart';
import 'package:app/widgets/side_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    _setLoading(true);
    _loggedin = await BackendService.isLoggedIn;
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  bool _loading = true;
  bool _loggedin = false;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ChangeNotifierProvider<AccountViewModel>(
        create: (context) => AccountViewModel(),
        child: Consumer<AccountViewModel>(
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // flexibleSpace: Image.asset(
              //   'lib/assets/logo_300x200.png',
              //   // height: 400,
              // ),
            ),
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
                if (_loggedin || value.response.data != null)
                  SideDrawerItem(
                    onPressed: () {},
                    icon: Icons.logout,
                    color: Colors.white,
                    label: 'Logout',
                  ),
              ],
            ),
            bottomNavigationBar: BottomNavigation(
              children: [
                if (!_loggedin) ...[
                  BottomNavigationItem(
                    onPressed: () {},
                    icon: Icons.person_add_alt,
                    color: Colors.white,
                    label: 'Registrieren',
                  ),
                  BottomNavigationItem(
                    onPressed: () async {
                      _loggedin = await showLogin(context);
                    },
                    icon: Icons.login,
                    color: Colors.white,
                    label: 'Login',
                  ),
                ] else
                  BottomNavigationItem(
                    onPressed: () {},
                    icon: Icons.person_search,
                    color: Colors.white,
                    label: 'Personen',
                  ),
                BottomNavigationItem(
                  onPressed: () {},
                  icon: Icons.dashboard,
                  color: Colors.white,
                  label: 'Dashboard',
                ),
                ...[]
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Center(
                child: _loading
                    ? const CircularProgressIndicator(
                        color: Colors.grey,
                      )
                    : Column(
                        children: [
                          Image.asset(
                            'lib/assets/logo_300x200.png',
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
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
