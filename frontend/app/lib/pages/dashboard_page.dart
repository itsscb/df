import 'package:app/gapi/client.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key, required this.client});

  final Client client;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _loading = false;

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.client.accessToken == '') {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.client.accessToken);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        flexibleSpace: Image.asset(
          'lib/assets/logo_300x200.png',
          height: 80,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.menu),
        //     tooltip: 'Menu',
        //   ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.login_sharp),
        //   tooltip: 'Login',
        // ),
        // ],
      ),
      body: Text(
        widget.client.accessToken,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
