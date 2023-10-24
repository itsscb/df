import 'package:flutter/material.dart';

import 'package:app/pages/main_screen.dart';

class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    navigatorKey: GlobalVariable.navigatorState,
    home: MainScreen(),
  ));
}
