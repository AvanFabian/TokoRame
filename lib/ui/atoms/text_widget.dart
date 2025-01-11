import 'package:flutter/material.dart';

/// A reusable widget for displaying styled text.
///
/// [TextWidget] provides a convenient way to display text with an optional custom style.
/// If no style is provided, it defaults to the [bodyLarge] text style from the theme.
class TextWidget extends StatelessWidget {
  final String text; // The text content to display.
  final TextStyle? style; // Optional custom text style.

  /// Creates a [TextWidget] with the given text and optional style.
  ///
  /// - [text] is required and specifies the string to be displayed.
  /// - [style] is optional and can be used to customize the appearance of the text.
  const TextWidget({
    required this.text, // The text content to display.
    this.style, // Optional custom style for the text.
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // The text to display.
      style: style ?? Theme.of(context).textTheme.bodyLarge, // Default to bodyLarge style if no custom style is provided.
      textAlign: TextAlign.center, // Center-align the text by default.
    );
  }
}
