import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideDrawer extends StatelessWidget {
  SideDrawer({super.key, required this.children, this.backgroundColor}) {
    backgroundColor ??= Colors.black;
  }

  final List<Widget> children;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          }),
        ),
      ),
    );
  }
}
