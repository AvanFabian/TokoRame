import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String imagePath; // Path to the image asset.

  const SliderItem({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    // Display the image with fit width.
    return Image.asset( // Load the image from the asset bundle.
      imagePath, // Image source.
      fit: BoxFit.fitWidth, // Ensures the image fits the width of the container.
    );
  }
}
