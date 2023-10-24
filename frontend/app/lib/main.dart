import 'package:flutter/material.dart';

import 'package:app/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}
