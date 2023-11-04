import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.children,
    this.backgroundColor,
    this.iconColor,
  }) {
    backgroundColor ??= Colors.black;
  }

  List<Widget> children;
  Color? backgroundColor;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: backgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              // horizontal: 10,
              ),
          child: Row(
            mainAxisAlignment: children.isEmpty
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...children,
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
