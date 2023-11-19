import 'package:app/model/services/storage_service.dart';
import 'package:app/pages/loading_page.dart';
import 'package:app/pages/notifications_page.dart';
import 'package:app/util/colors.dart';
import 'package:app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class LatePersonPage extends StatefulWidget {
  const LatePersonPage({super.key});

  @override
  State<LatePersonPage> createState() => _LatePersonPageState();
}

class _LatePersonPageState extends State<LatePersonPage> {
  final StorageService _storageService = StorageService();
  bool _loading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    if (await _storageService.accountLevel < 6) {
      await _storageService.setAccountLevel(6);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: BackButton(
        color: CustomColors.primary,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => const NotificationsPage()));
        },
      ),
      children: _loading
          ? [
              LoadingPage(),
            ]
          : [
              const Text(
                'Daten der Verstorbenen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'sans-serif',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 25,
                ),
              ),
            ],
    );
  }
}
