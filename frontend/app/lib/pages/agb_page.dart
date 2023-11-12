import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class AgbPage extends StatelessWidget {
  AgbPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.primary),
      ),
      backgroundColor: Colors.black,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'TODO: insert AGBs',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
