import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';

class SideDrawerItem extends StatelessWidget {
  SideDrawerItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.label,
    this.textSize,
    this.iconSize,
  }) {
    textSize ??= 15;
    iconSize ??= 25;
  }

  void Function() onPressed;
  IconData icon;
  Color color;
  String label;
  double? textSize;
  double? iconSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: textSize,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
