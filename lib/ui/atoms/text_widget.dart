import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextWidget({required this.text, this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
