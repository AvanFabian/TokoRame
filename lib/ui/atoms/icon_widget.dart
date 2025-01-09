import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final double? size;

  const IconWidget({
    required this.icon,
    required this.onPressed,
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color ?? Colors.black, size: size ?? 24.0),
      onPressed: onPressed,
    );
  }
}
