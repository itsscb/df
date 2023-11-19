import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'logo',
        child: Image.asset(
          'assets/icons/icon.jpg',
          // height: 180,
        ),
      ),
    );
  }
}
