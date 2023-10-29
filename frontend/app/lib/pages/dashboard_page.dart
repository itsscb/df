import 'package:app/gapi/client.dart';
import 'package:app/pb/account_info.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.client});

  final GClient client;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _loading = false;
  late AccountInfo accountInfo;

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  @override
  void initState() {
    super.initState();
    // if (widget.client.session.accessToken == '') {
    //   Navigator.of(context).pop();
    //   return;
    // }

    _setLoading(true);
    widget.client.getAccountInfo(
      GetAccountInfoRequest(
        accountId: widget.client.session?.accountId,
      ),
      onError: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('AccountInfo konnte nicht geladen werden'),
        ));
      },
    ).then((value) {
      accountInfo = value.accountInfo;
      _setLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Image.asset(
            'lib/assets/logo_300x200.png',
            height: 80,
          ),
        ),
        bottomNavigationBar: BottomBar(),
        body: !_loading
            ? Background(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 48,
                      ),
                      Text(
                        'Willkommen ${accountInfo.firstname} ${accountInfo.lastname}!',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'back',
          backgroundColor: Colors.white,
          icon: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: 'Menu',
          icon: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.black,
    );
  }
}
