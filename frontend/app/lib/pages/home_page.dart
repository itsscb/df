import 'package:app/model/apis/api_response.dart';
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
    // if (!_loggedin) {
    //   await BackendService.logout();
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (builder) => HomePage()),
    //       (route) => false);
    // }
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  void _checkResponse(ApiResponse response) async {
    print('${response.message}');
    if (response.status == Status.ERROR &&
        response.message!.contains('unauthorized')) {
      await BackendService.logout();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) => const HomePage()),
          (route) => false);
    }
  }

  bool _loading = true;
  bool _loggedin = false;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: ChangeNotifierProvider<AccountViewModel>(
        create: (context) => AccountViewModel(),
        child: Consumer<AccountViewModel>(
          builder: (context, value, child) {
            _checkResponse(value.response);
            return Scaffold(
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
                  if (_loggedin && value.response.data != null)
                    SideDrawerItem(
                      onPressed: () async {
                        setState(() {
                          _loading = true;
                        });
                        await BackendService.logout();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (builder) => const HomePage()),
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
                        final bool res =
                            await showLogin(context, registration: true);
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
                        final bool res = await showLogin(context);
                        setState(() {
                          _loggedin = res;
                        });
                      },
                      icon: Icons.login,
                      color: Colors.white,
                      label: 'Login',
                    ),
                  ] else
                    BottomNavigationItem(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => const PersonsPage()));
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
            );
          },
        ),
      ),
    );
  }
}
