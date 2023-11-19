import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.children,
    this.backButton,
  });

  final List<Widget> children;
  final Widget? backButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: backButton,
          iconTheme: IconThemeData(color: CustomColors.primary),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
