import 'package:flutter/material.dart';
import '../molecules/slider_item.dart';

class ProductSlider extends StatelessWidget {
  final List<String> images;

  const ProductSlider({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Transform.translate(
          offset: Offset(0, -MediaQuery.of(context).size.height * 0.21), // 20% of screen height
          child: SliderItem(imagePath: images[index]),
        );
      },
    );
  }
}
