import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;

  const ImageWidget({
    required this.imagePath,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit,
    );
  }
}
