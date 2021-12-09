import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.onTap,
    this.color,
    this.iconData,
    this.text,
    this.textColor,
  }) : super(key: key);
  final VoidCallback? onTap;
  final Color? color;
  final IconData? iconData;
  final String? text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 35,
            color: color,
          ),
          Text(
            text!,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
