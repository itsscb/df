import 'package:app/gapi/client.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/pages.dart';

Map<Pages, List<BottomNavigationBarItem>> bottomBarButtons = {
  Pages.start: const [
    BottomNavigationBarItem(
      label: 'Zurueck',
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      label: 'AccountInf',
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
  ],
  Pages.persons: const [
    BottomNavigationBarItem(
      label: 'Zurueck',
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      label: 'AccountInf',
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
  ],
  Pages.about: const [
    BottomNavigationBarItem(
      label: 'Zurueck',
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      label: 'AccountInf',
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
  ],
  Pages.login: const [
    BottomNavigationBarItem(
      label: 'Zurueck',
      backgroundColor: Colors.white,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      label: 'AccountInf',
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
  ]
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;

  Pages _selectedPage = Pages.start;

  Widget _selectPage(Pages page) {
    switch (page) {
      case Pages.login:
        return LoginPage(
            // onChangePage: changePage,
            );
      default:
        return StartPage(
            // onChangePage: changePage,
            );
    }
  }

  Future<bool> _onWillPop() async {
    changePage(Pages.start);
    return false;
  }

  void changePage(Pages page) {
    if (!Pages.values.contains(page)) {
      page = _selectedPage;
    }
    setState(() {
      _selectedPage = page;
    });
  }

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  final GClient client = GClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedPage == Pages.start
          ? AppBar(
              automaticallyImplyLeading: false,
            )
          : AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Image.asset(
                'lib/assets/logo_300x200.png',
                height: 80,
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarButtons[_selectedPage]!.toList(),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Center(
          child: WillPopScope(
            child: _selectPage(_selectedPage),
            onWillPop: () => _onWillPop(),
          ),
        ),
      ),
    );
  }
}
