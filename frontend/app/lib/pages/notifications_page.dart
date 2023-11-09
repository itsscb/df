import 'package:app/pages/registration_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const RegistrationPage(),
                        // builder: (builder) => SecurityPage(),
                      ),
                    );
                  },
                  child: const SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mitteilungen erhalten',
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
                height: 10,
              ),
              TextButton(
                onPressed: () {},
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
