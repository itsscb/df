import 'package:app/model/services/storage_service.dart';
import 'package:app/pages/registration_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final StorageService _storageService = StorageService();
  bool _loading = true;

  Future<void> _setNotificationSetting(bool enabled) async {
    await _storageService.setNotificationSetting(enabled);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    final accountLevel = await _storageService.accountLevel;
    if (accountLevel > 2 && mounted) {
      await Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const RegistrationPage()));
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
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: BackButton(
                  color: CustomColors.primary,
                  onPressed: () async {
                    await _storageService.setAccountLevel(1);
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                ),
                iconTheme: IconThemeData(
                  color: CustomColors.primary,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Image.asset('assets/chat_bubbles.png'),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Erhalte Mitteilungen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'sans-serif',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Du erhältst z. B. eine Mitteilung sobald wir eine Digitale Spur gefunden haben.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Du kannst die Mitteilungen jederzeit wieder deaktivieren.',
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Hero(
                      tag: 'flow-button',
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                        ),
                        onPressed: () async {
                          await _setNotificationSetting(true);
                          await _storageService.setAccountLevel(3);
                          if (mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const RegistrationPage(),
                                // builder: (builder) => SecurityPage(),
                              ),
                            );
                          }
                        },
                        child: const SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Mitteilungen erhalten',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () async {
                        await _setNotificationSetting(false);
                        await _storageService.setAccountLevel(3);
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => const RegistrationPage(),
                              // builder: (builder) => SecurityPage(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Später',
                        style: TextStyle(color: CustomColors.primary),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
