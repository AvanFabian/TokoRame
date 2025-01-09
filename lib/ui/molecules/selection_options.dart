import 'package:flutter/material.dart';

class SelectionOptions extends StatelessWidget {
  final List<String> sizes;
  final List<Color> colors;

  const SelectionOptions({
    required this.sizes,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ukuran",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: sizes
              .map((size) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(
                      label: Text(size),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
        const Text(
          "Warna",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: colors
              .map((color) => Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
