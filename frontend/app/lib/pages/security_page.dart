import 'package:app/model/services/auth_service.dart';
import 'package:app/pages/notifications_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsPage()),
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
