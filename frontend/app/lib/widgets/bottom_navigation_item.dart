import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigationItem extends StatelessWidget {
  BottomNavigationItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
    this.textSize,
    this.iconSize,
    this.label,
  }) {
    textSize ??= 15;
    iconSize ??= 25;
  }

  void Function() onPressed;
  IconData icon;
  Color color;
  double? textSize;
  double? iconSize;
  String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          label != null ? MainAxisAlignment.center : MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: iconSize,
              color: color,
            )),
        if (label != null)
          Text(
            label!,
            style: TextStyle(fontSize: textSize, color: color),
          ),
      ],
    );
  }
}
