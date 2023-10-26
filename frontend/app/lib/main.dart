import 'package:app/pages/login_page.dart';
import 'package:app/widgets/background.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: Colors.black,
            onSecondary: Colors.white,
            error: Color.fromARGB(170, 255, 0, 0),
            onError: Color.fromARGB(170, 255, 0, 0),
            background: Colors.transparent,
            onBackground: Colors.white,
            surface: Colors.black,
            onSurface: Colors.white,
          ),
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
              color: Colors.grey,
            ),
          ),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          )),
      home: const Background(child: LoginPage()),
    ),
  );
}
