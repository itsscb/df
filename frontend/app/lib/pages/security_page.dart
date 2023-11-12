import 'package:app/model/services/auth_service.dart';
import 'package:app/model/services/storage_service.dart';
import 'package:app/pages/notifications_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final StorageService _storageService = StorageService();
  bool _loading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    final accountLevel = await _storageService.accountLevel;
    if (accountLevel > 1 && mounted) {
      await Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const NotificationsPage()));
      setState(() {
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _loading
          ? Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/JPEG.jpg',
                      height: 180,
                    ),
                  ),
                  CircularProgressIndicator(
                    color: CustomColors.primary,
                  ),
                ],
              ),
            )
          : Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  color: CustomColors.primary,
                  onPressed: () async {
                    await _storageService.setAccountLevel(0);
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
                iconTheme: IconThemeData(color: CustomColors.primary),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Center(
                  child: Column(
                    children: [
                      const Spacer(),
                      const Hero(
                        tag: 'flow-icon',
                        child: Icon(
                          Icons.fingerprint,
                          color: Colors.white,
                          size: 200,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Deine Sicherheit kommt an erster Stelle',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'sans-serif',
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Schütze dein Konto mit der biometrischen Erkennung deines Geräts oder lege einen Code fest.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'sans-serif',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Hero(
                        tag: 'flow-button',
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.primary,
                          ),
                          onPressed: () async {
                            bool isAuthenticated =
                                await AuthService.authenticateWithBiometrics();
                            if (isAuthenticated) {
                              await _storageService.setAccountLevel(2);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationsPage()),
                              );
                            }
                          },
                          child: const SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'App absichern',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: CustomColors.secondary,
                      //   ),
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (builder) => SecurityPage(),
                      //       ),
                      //     );
                      //   },
                      //   child: const SizedBox(
                      //     height: 60,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           'Eigenen Code festlegen',
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 22,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
