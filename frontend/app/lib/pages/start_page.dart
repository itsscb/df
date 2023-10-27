import 'package:app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class StartPage extends StatelessWidget {
  StartPage({
    super.key,
    required this.onChangePage,
  });

  void Function(Pages page) onChangePage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(
            'lib/assets/logo_300x200.png',
          ),
        ),
        // Text(
        //   'Peace of Mind \nin the\nAfterlife',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     fontFamily: 'JosefinSans',
        //     height: 1.7,
        //     letterSpacing: 8,
        //     wordSpacing: 2,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 32,
        //     color: Colors.white,
        //     decoration: TextDecoration.none,
        //     decorationColor: Colors.white,
        //   ),
        // ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Digitale Spuren auf Knopfdruck entfernen'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'sans-serif',
            fontSize: 24,
            height: 1.6,
            fontWeight: FontWeight.normal,
            letterSpacing: 6,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              label: const Text('Login'),
              onPressed: () {
                onChangePage(Pages.login);
              },
              icon: const Icon(
                Icons.login,
                semanticLabel: 'Login',
                size: 16,
              ),
            ),
            ElevatedButton.icon(
              label: const Text('Registrieren'),
              onPressed: () {},
              icon: const Icon(
                Icons.person_add,
                semanticLabel: 'Register',
                size: 16,
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   height: 32,
        // ),

        // const Text('data'),
      ],
    );
  }
}
