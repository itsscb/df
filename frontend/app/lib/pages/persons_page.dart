import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/model/view_model/persons_vm.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pb/person.pb.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:app/widgets/bottom_navigation_item.dart';
import 'package:app/widgets/side_drawer.dart';
import 'package:app/widgets/side_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({super.key});

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
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

  void _checkResponse(ApiResponse response) {
    if (response.status == Status.ERROR &&
        response.message!.contains('unauthenticated')) {
      BackendService.logout();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) => const HomePage()),
          (route) => false);
    }
  }

  bool _loading = true;
  bool _loggedin = false;

  List<Widget> _personsList(List<Person> persons) {
    final List<Widget> list = [];
    for (var p in persons) {
      list.add(Card(
        color: Colors.black,
        child: Text(
          '${p.firstname} ${p.lastname}',
          style: const TextStyle(color: Colors.white),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: ChangeNotifierProvider<PersonsViewModel>(
        create: (context) => PersonsViewModel(),
        child: Consumer<PersonsViewModel>(
          builder: (context, value, child) {
            _checkResponse(value.response);
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              appBar: AppBar(
                automaticallyImplyLeading: false,
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
                  BottomNavigationItem(
                    onPressed: () {},
                    icon: Icons.dashboard,
                    color: Colors.white,
                    label: 'Dashboard',
                  ),
                  BottomNavigationItem(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.home,
                    color: Colors.white,
                    label: 'Home',
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: _loading
                      ? const CircularProgressIndicator(
                          color: Colors.grey,
                        )
                      : value.response.status == Status.COMPLETED
                          ? value.response.data.length > 0
                              ? ListView(
                                  children: _personsList(
                                      (value.response.data as List<Person>)))
                              : const Text('Noch keine Personen angelegt')
                          : const Text('Lade Daten...'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
