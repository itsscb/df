import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.children,
        ),
      ),
    );
  }
}
