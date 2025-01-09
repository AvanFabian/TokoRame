import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String imagePath;

  const SliderItem({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.fitWidth,
    );
  }
}
