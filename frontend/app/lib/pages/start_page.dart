import 'package:app/model/services/storage_service.dart';
import 'package:app/pages/agb_page.dart';
import 'package:app/pages/security_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final StorageService _storageService = StorageService();
  bool _loading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    int accountLevel = await _storageService.accountLevel;
    if (accountLevel > 0 && mounted) {
      await Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const SecurityPage()));
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
                iconTheme: IconThemeData(color: CustomColors.primary),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Column(
                  children: [
                    Hero(
                      tag: 'flow-icon',
                      child: Image.asset(
                        'assets/JPEG.jpg',
                        height: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hallo. Digitale Spuren\nentfernen\nper Knopfdruck.',
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
                      'Mit uns finden Sie Ihre Digitalen Spuren und können diese entfernen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'sans-serif',
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Hero(
                      tag: 'flow-button',
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                        ),
                        onPressed: () async {
                          await _storageService.setAccountLevel(1);
                          if (mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const SecurityPage(),
                                // builder: (builder) => SecurityPage(),
                              ),
                            );
                          }
                        },
                        child: const SizedBox(
                          height: 60,
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
                    const Spacer(
                      flex: 1,
                    ),
                    const Text(
                      'Mit der weiteren Nutzung stimmst du den folgenden Bedingungen zu:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'sans-serif',
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (builder) => AgbPage());
                        },
                        child: Text(
                          'AGB - Datenschutzerklärung',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: CustomColors.primary),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
