import 'package:flutter/material.dart';

/// A reusable widget that combines an icon and text in a horizontal layout.
///
/// [IconWithText] allows for customization of the icon, text, size, and style,
/// making it suitable for scenarios like labels, badges, or simple informational displays.
class IconWithText extends StatelessWidget {
  final IconData icon; // The icon to be displayed.
  final String text; // The text to be displayed next to the icon.
  final double iconSize; // The size of the icon.
  final TextStyle? textStyle; // Optional custom text style.

  /// Creates an [IconWithText] widget.
  ///
  /// - [icon] is required and specifies the icon to display.
  /// - [text] is required and specifies the accompanying text.
  /// - [iconSize] defaults to 16 and controls the size of the icon.
  /// - [textStyle] is optional and allows customization of the text style.
  const IconWithText({
    required this.icon, // Icon to display.
    required this.text, // Text to display alongside the icon.
    this.iconSize = 16, // Default size of the icon.
    this.textStyle, // Optional text style for the label.
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // The icon displayed with the specified size and color.
        Icon(
          icon, // Icon to display.
          size: iconSize, // Sets the size of the icon.
          color: Colors.grey, // Default icon color.
        ),
        const SizedBox(width: 4), // Spacing between the icon and text.
        // The text displayed with the specified or default style.
        Text(
          text, // Text to display.
          style: textStyle ?? const TextStyle(fontSize: 12, color: Colors.grey), // Use custom or default style.
        ),
      ],
    );
  }
}
