import 'package:app/pb/account_info.pb.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.account_info});

  AccountInfo account_info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Willkommen ${account_info.firstname}!',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
