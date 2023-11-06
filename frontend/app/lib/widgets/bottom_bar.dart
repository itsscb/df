import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.children,
  });

  final List<BottomNavigationBarItem> children;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: children,
      backgroundColor: Colors.black,
      fixedColor: Colors.black,
      // onTap: (value) => _bottomBarAction(value),
    );
  }
}
