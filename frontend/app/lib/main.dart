import 'package:app/pages/start_page.dart';
import 'package:app/pages_draft/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalMaterialLocalizations;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('de')],
      theme: ThemeData().copyWith(
          canvasColor: Colors.black,
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
      home: StartPage(),
    ),
  );
}
