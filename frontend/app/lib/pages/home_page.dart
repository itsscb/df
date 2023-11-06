import 'package:app/model/services/backend_service.dart';
import 'package:app/model/view_model/account_vm.dart';
import 'package:app/pages/login_overlay.dart';
import 'package:app/pages/persons_page.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:app/widgets/bottom_navigation_item.dart';
import 'package:app/widgets/drawer.dart';
import 'package:app/widgets/side_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key, required this.loggedOut});

  bool loggedOut;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  AccountViewModel vm = AccountViewModel();
  void _init() async {
    // _setLoading(true);
    // _setLoading(widget.loggedOut);
    // _loading = widget.loggedOut;
    // _loggedin = await BackendService.isLoggedIn;
    // if (!_loggedin) {
    //   await BackendService.logout();
    //   final navigator = Navigator.of(context);
    //   navigator.pushAndRemoveUntil(
    //       MaterialPageRoute(
    //           builder: (builder) => HomePage(
    //                 loggedOut: true,
    //               )),
    //       (route) => false);
    // }
    _setLoading(false);
  }

  _isLoggedIn(BuildContext context) async {
    bool logged = await vm.isLoggedIn(context);
    setState(() {
      _loggedin = logged;
    });
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
        child: Scaffold(
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
          if (_loggedin)
            SideDrawerItem(
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                await BackendService.logout();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (builder) => HomePage(
                              loggedOut: true,
                            )),
                    (route) => false);
                setState(() {
                  _loggedin = false;
                  _loading = false;
                });
              },
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
              onPressed: () async {
                final bool res = await showLogin(context, registration: true);
                setState(() {
                  _loggedin = res;
                });
              },
              icon: Icons.person_add_alt,
              color: Colors.white,
              label: 'Registrieren',
            ),
            BottomNavigationItem(
              onPressed: () async {
                bool res = await showLogin(context);
                setState(() {
                  _loggedin = res;
                  // vm.isLoggedIn(context);
                });
              },
              icon: Icons.login,
              color: Colors.white,
              label: 'Login',
            ),
          ] else
            BottomNavigationItem(
              onPressed: () async {
                final navigator = Navigator.of(context);
                if (await vm.isLoggedIn(context)) {
                  navigator.push(MaterialPageRoute(
                      builder: (builder) => const PersonsPage()));
                } else {
                  navigator.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (builder) => const PersonsPage()),
                      (route) => false);
                }
              },
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
        padding: const EdgeInsets.fromLTRB(16, 45, 16, 16),
        child: Center(
          child: ChangeNotifierProvider<AccountViewModel>(
              create: (context) => AccountViewModel(),
              child:
                  Consumer<AccountViewModel>(builder: (context, value, child) {
                // _checkResponse(value.response);
                if (!widget.loggedOut) {
                  _isLoggedIn(context);
                }
                return _loading
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
                      );
              })),
        ),
      ),
    ));
  }
}
