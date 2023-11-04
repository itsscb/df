import 'package:app/gapi/client.dart';
import 'package:app/pages_old/start_page.dart';
import 'package:app/pb/account_info.pb.dart';
import 'package:app/pb/rpc_get_account_info.pb.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_bar.dart';
import 'package:app/widgets/loading_widget.dart';
import 'package:app/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    // required this.client,
  });

  // final GClient client;

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

    _setLoading(true);
    // widget.client.getAccountInfo(
    //   GetAccountInfoRequest(
    //     accountId: widget.client.session.accountId,
    //   ),
    //   onError: ({String? msg}) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: const Text('AccountInfo konnte nicht geladen werden'),
    //         action: msg != null
    //             ? SnackBarAction(
    //                 label: 'Details',
    //                 textColor: Colors.grey,
    //                 onPressed: () {
    //                   showDialog(
    //                     context: context,
    //                     builder: (context) {
    //                       return AlertDialog(
    //                         content: Text(
    //                           msg,
    //                           textAlign: TextAlign.center,
    //                           style: const TextStyle(color: Colors.black),
    //                         ),
    //                         icon: const Icon(
    //                           Icons.warning,
    //                           color: Colors.red,
    //                         ),
    //                       );
    //                     },
    //                   );
    //                 })
    //             : null,
    //       ),
    //     );
    //   },
    // ).then((value) {
    //   accountInfo = value.accountInfo;
    //   _setLoading(false);
    // });
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
        drawer: Builder(builder: (context) {
          return SideDrawer(
            children: [
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
              // if (widget.client.session.accessToken != null)
              //   TextButton(
              //     onPressed: () {
              //       widget.client.session.accessToken = null;
              //       widget.client.session
              //           .removeSession(widget.client.session.sessionId!);

              //       Navigator.of(context).pushAndRemoveUntil(
              //           MaterialPageRoute(
              //             builder: (context) =>
              //                 StartPage(client: widget.client),
              //           ),
              //           (route) => false);
              //     },
              //     child: const Row(
              //       children: [
              //         Text(
              //           'Log out',
              //           style: TextStyle(fontSize: 20),
              //         ),
              //         Spacer(),
              //         Icon(
              //           Icons.logout,
              //           color: Colors.white,
              //         ),
              //       ],
              //     ),
              //   ),
              const SizedBox(
                height: 250,
              )
            ],
          );
        }),
        // bottomNavigationBar: Builder(
        //   builder: (context) {
        //     return BottomBar(
        //       children: widget.client.session.accessToken != null
        //           ? [
        //               BottomNavigationBarItem(
        //                 backgroundColor: Colors.white,
        //                 label: 'Personen',
        //                 icon: Column(
        //                   children: [
        //                     IconButton(
        //                       onPressed: () =>
        //                           Scaffold.of(context).openDrawer(),
        //                       icon: const Icon(
        //                         Icons.group,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                     const Text(
        //                       'Personen',
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 16,
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 backgroundColor: Colors.white,
        //                 label: 'Home',
        //                 icon: Column(
        //                   children: [
        //                     IconButton(
        //                       onPressed: () {
        //                         Navigator.of(context).push(
        //                           MaterialPageRoute(
        //                             builder: (context) => StartPage(
        //                               client: widget.client,
        //                             ),
        //                           ),
        //                         );
        //                       },
        //                       icon: const Icon(
        //                         Icons.home,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                     const Text(
        //                       'Home',
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 16,
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 backgroundColor: Colors.white,
        //                 label: 'Menu',
        //                 icon: IconButton(
        //                   onPressed: () {
        //                     Scaffold.of(context).openDrawer();
        //                   },
        //                   icon: const Icon(
        //                     Icons.menu,
        //                     color: Colors.white,
        //                   ),
        //                 ),
        //               )
        //             ]
        //           : [
        //               BottomNavigationBarItem(
        //                 label: 'back',
        //                 backgroundColor: Colors.white,
        //                 icon: IconButton(
        //                   onPressed: () {},
        //                   icon: const Icon(
        //                     Icons.arrow_back,
        //                     color: Colors.white,
        //                   ),
        //                 ),
        //               ),
        //               BottomNavigationBarItem(
        //                 backgroundColor: Colors.white,
        //                 label: 'Menu',
        //                 icon: IconButton(
        //                   onPressed: () => Scaffold.of(context).openDrawer(),
        //                   icon: const Icon(
        //                     Icons.menu,
        //                     color: Colors.white,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //     );
        //   },
        // ),
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
