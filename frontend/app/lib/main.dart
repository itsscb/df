import 'package:app/model/services/auth_service.dart';
import 'package:app/model/services/storage_service.dart';
import 'package:app/pages/notifications_page.dart';
import 'package:app/pages/start_page.dart';
import 'package:app/pages/verify_email_page.dart';
import 'package:app/pages/registration_page.dart';
import 'package:app/util/colors.dart';
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
      home: const DigitalerFrieden(),
    ),
  );
}

class DigitalerFrieden extends StatefulWidget {
  const DigitalerFrieden({super.key});

  @override
  State<DigitalerFrieden> createState() => _DigitalerFriedenState();
}

class _DigitalerFriedenState extends State<DigitalerFrieden> {
  final StorageService _storageService = StorageService();
  int? accountLevel;
  bool? authenticated;
  bool _loading = true;
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    accountLevel = await _storageService.accountLevel;
    print(accountLevel!);
    if (accountLevel! > 0) {
      authenticated = await AuthService.authenticateWithBiometrics();
    }
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/JPEG.jpg',
              height: 180,
            ),
            CircularProgressIndicator(
              color: CustomColors.primary,
            ),
          ],
        ),
      );
    }
    if (accountLevel == null || accountLevel == 0) {
      return const StartPage();
    }
    // else if (authenticated == null) {
    //   AuthService.authenticateWithBiometrics().then((value) {
    //     setState(() {
    //       authenticated = value;
    //     });
    //   });
    // }

    switch (accountLevel) {
      case null:
        return const StartPage();
      case < 1:
        return NotificationsPage();
      case 1:
        return const RegistrationPage();
      case 2:
        return VerifyEmailPage();
      default:
        return const StartPage();
    }
  }
}
