import 'package:app/pages/home_page.dart';
import 'package:app/widgets/side_drawer_item.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key, required this.children, this.backgroundColor}) {
    backgroundColor ??= Colors.black;
  }

  List<Widget> children;
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
