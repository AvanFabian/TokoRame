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
              .asMap()
              .map((index, size) => MapEntry(
                    index,
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        backgroundColor: const Color(0xFFE6E7E7),
                        label: Text(
                          size,
                          style: TextStyle(
                            fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal, // Text color for the first chip                            
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: BorderSide(
                            color: index == 0 ? Colors.black : Colors.transparent, // Border color for the first chip
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ))
              .values
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
              .asMap()
              .map((index, color) => MapEntry(
                    index,
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index == 0 ? Colors.black : Colors.transparent, // Border color for the first circle
                          width: 2.0,
                        ),
                      ),
                    ),
                  ))
              .values
              .toList(),
        ),
      ],
    );
  }
}
