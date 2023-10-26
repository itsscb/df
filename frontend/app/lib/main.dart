import 'package:app/pages/login_page.dart';
import 'package:app/widgets/background.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          textTheme: const TextTheme().copyWith(
            titleLarge: const TextStyle(
              color: Colors.white,
            ),
            titleMedium: const TextStyle(
              color: Colors.white,
            ),
            titleSmall: const TextStyle(
              color: Colors.white,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          )),
      home: Background(child: LoginPage()),
    ),
  );
}
