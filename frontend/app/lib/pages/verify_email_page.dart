import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatelessWidget {
  VerifyEmailPage({super.key});

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
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
