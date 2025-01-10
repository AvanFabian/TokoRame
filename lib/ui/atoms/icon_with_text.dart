import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final TextStyle? textStyle;

  const IconWithText({
    required this.icon,
    required this.text,
    this.iconSize = 16,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: iconSize, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: textStyle ?? const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
