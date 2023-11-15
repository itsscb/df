import 'package:app/model/services/storage_service.dart';
import 'package:app/model/view_model/base_vm.dart';
import 'package:app/pages/notifications_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final StorageService _storageService = StorageService();
  final BaseViewModel _vm = BaseViewModel();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    if (await _storageService.accountLevel < 4) {
      await _storageService.setAccountLevel(4);
    }
    setState(() {
      _loading = false;
    });
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
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const NotificationsPage()),
                        (route) => false);
                  },
                ),
                iconTheme: IconThemeData(
                  color: CustomColors.primary,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        'Verifizieren',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Wir haben dir eine E-Mail geschickt.',
                        textAlign: TextAlign.center,
                        // textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Bitte verifiziere deine E-Mail Adresse, dann geht es weiter.',
                        textAlign: TextAlign.center,
                        // textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Hero(
                        tag: 'flow-button',
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.primary,
                          ),
                          onPressed: () {},
                          child: const SizedBox(
                            height: 50,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Weiter',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        'Noch keine E-Mail erhalten?',
                        // textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Schon im Spam-Ordner nachgeschaut?',
                        // textAlign: TextAlign.center,
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      TextButton(
                        onPressed: () async {
                          await _vm.resendVerification(context);
                        },
                        child: Text(
                          'Erneut senden',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.primary,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      const Text('Account versehentlich angelegt?'),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      TextButton(
                        onPressed: () async {},
                        child: Text(
                          'Account löschen',
                          style: TextStyle(
                            color: CustomColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
