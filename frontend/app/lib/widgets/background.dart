import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          // color: Color.fromARGB(230, 255, 255, 255),
          gradient: LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage(
              'lib/assets/hero-pattern-300x200.png',
              // color: Colors.grey,
            ),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.contain,
          ),
        ),
        child: child);
  }
}
