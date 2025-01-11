import 'package:flutter/material.dart';

/// A widget that displays selectable options for sizes and colors.
/// The first size and color options are visually emphasized.
class SelectionOptions extends StatelessWidget {
  final List<String> sizes; // A list of size options to display.
  final List<Color> colors; // A list of color options to display.

  const SelectionOptions({
    required this.sizes,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start.
      children: [
        // Title for the size selection.
        const Text(
          "Ukuran", // "Size" in Indonesian.
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Bold and large font.
        ),
        const SizedBox(height: 8), // Space between title and size options.

        // Row displaying size options as chips.
        Row(
          children: sizes
              .asMap() // Convert the list of sizes to a map with indices.
              .map((index, size) => MapEntry(
                    index,
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0), // Spacing between chips.
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 16), // Inner padding of the chip.
                        backgroundColor: const Color(0xFFE6E7E7), // Light gray background color for the chip.
                        label: Text(
                          size, // Display the size text.
                          style: TextStyle(
                            fontWeight: index == 0
                                ? FontWeight.bold
                                : FontWeight.normal, // Bold font for the first size option.
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0), // Rounded corners for the chip.
                          side: BorderSide(
                            color: index == 0
                                ? Colors.black
                                : Colors.transparent, // Black border for the first chip.
                            width: 1.0, // Border thickness.
                          ),
                        ),
                      ),
                    ),
                  ))
              .values
              .toList(), // Convert the map entries back to a list of widgets.
        ),
        const SizedBox(height: 16), // Space between size and color sections.

        // Title for the color selection.
        const Text(
          "Warna", // "Color" in Indonesian.
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Bold and large font.
        ),
        const SizedBox(height: 8), // Space between title and color options.

        // Row displaying color options as circular widgets.
        Row(
          children: colors
              .asMap() // Convert the list of colors to a map with indices.
              .map((index, color) => MapEntry(
                    index,
                    Container(
                      margin: const EdgeInsets.only(right: 8.0), // Spacing between circles.
                      width: 44, // Fixed width for the circle.
                      height: 44, // Fixed height for the circle.
                      decoration: BoxDecoration(
                        color: color, // Fill color of the circle.
                        shape: BoxShape.circle, // Circular shape.
                        border: Border.all(
                          color: index == 0
                              ? Colors.black
                              : Colors.transparent, // Black border for the first circle.
                          width: 2.0, // Border thickness.
                        ),
                      ),
                    ),
                  ))
              .values
              .toList(), // Convert the map entries back to a list of widgets.
        ),
      ],
    );
  }
}
