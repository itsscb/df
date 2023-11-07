import 'package:app/model/apis/api_response.dart';
import 'package:app/model/services/backend_service.dart';
import 'package:app/model/view_model/persons_vm.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/person_details_page.dart';
import 'package:app/pb/person.pb.dart';
import 'package:app/util/validation.dart';
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
          MaterialPageRoute(
              builder: (builder) => HomePage(
                    loggedOut: true,
                  )),
          (route) => false);
    }
  }

  bool _loading = true;
  bool _loggedin = false;
  List<Person> persons = [];

  PersonsViewModel vm = PersonsViewModel();

  void listPersons(BuildContext context) async {
    persons = await vm.listPersons();
  }

  List<Widget> _personsList(List<Person> persons) {
    persons.sort((a, b) {
      final comp = a.lastname.compareTo(b.lastname);
      if (comp != 0) {
        return comp;
      }
      return a.firstname.compareTo(b.firstname);
    });
    final List<Widget> list = [];
    for (var p in persons) {
      list.add(TextButton(
        onPressed: () async {
          final Person per = await showPerson(context, person: p);
          setState(() {
            this.persons.add(per);
          });
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: const Color.fromARGB(100, 89, 88, 88),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            child: Row(
              children: [
                Container(
                  height: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.lastname.titleCase,
                        style: const TextStyle(color: Colors.white),
                        // overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Text(
                        p.firstname.titleCase,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                        // overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text('STATUS')
              ],
            ),
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final p = await showPerson(context);
            if (!p.id.isZero) {
              setState(() {
                persons.add(p);
              });
            }
          },
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
            child: ChangeNotifierProvider<PersonsViewModel>(
              create: (context) => PersonsViewModel(),
              child: Consumer<PersonsViewModel>(
                builder: (context, value, child) {
                  _checkResponse(value.response);
                  listPersons(context);
                  return _loading
                      ? const CircularProgressIndicator(
                          color: Colors.grey,
                        )
                      : value.response.status == Status.COMPLETED
                          ? value.response.data.length > 0
                              ? ListView(children: _personsList(persons))
                              : const Text('Noch keine Personen angelegt')
                          : const Text('Lade Daten...');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
