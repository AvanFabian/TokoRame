import 'package:flutter/material.dart';

/// A reusable customizable button widget.
///
/// [ButtonWidget] supports various customization options including icons, 
/// text formatting (with bold parts), and styling such as background color, 
/// border radius, and padding.
class ButtonWidget extends StatelessWidget {
  final String label; // Main label text displayed on the button.
  final Map<String, bool>? labelParts; // Map of text parts with bold specifications.
  final IconData? icon; // Optional icon displayed next to the text.
  final VoidCallback onPressed; // Function triggered when the button is pressed.
  final Color backgroundColor; // Background color of the button.
  final Color foregroundColor; // Text/icon color of the button.
  final FontWeight fontWeight; // Default font weight for non-bold text parts.
  final BorderRadius borderRadius; // Border radius for rounded corners.
  final BorderSide side; // Border style of the button.
  final EdgeInsets padding; // Inner padding for the button's content.
  final double fontSize; // Font size for the button's text.

  /// Creates a [ButtonWidget] with customizable styles and behavior.
  ///
  /// - [label] is required to display the main text.
  /// - [onPressed] is required to define the button's behavior.
  /// - [labelParts] is optional and allows bold styling for specific parts of the text.
  /// - [icon] is optional and allows an icon to be displayed alongside the text.
  /// - [backgroundColor], [foregroundColor], [borderRadius], [side], [padding], 
  ///   and [fontSize] provide additional customization for the button's appearance.
  const ButtonWidget({
    required this.label,
    this.labelParts, // Map of text parts with bold formatting options.
    required this.onPressed,
    this.icon, // Optional icon to display on the button.
    this.backgroundColor = Colors.black, // Default background color.
    this.foregroundColor = Colors.white, // Default text/icon color.
    this.fontWeight = FontWeight.normal, // Default font weight for non-bold text.
    required this.borderRadius, // Required border radius for rounded corners.
    required this.side, // Required border style for the button.
    this.padding = const EdgeInsets.symmetric(vertical: 10), // Default padding.
    this.fontSize = 16, // Default font size for the text.
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button take full width.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button's background color.
          foregroundColor: foregroundColor, // Button's text/icon color.
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius, // Sets rounded corners.
            side: side, // Sets border style.
          ),
          padding: padding, // Inner padding for button content.
          minimumSize: Size.zero, // Removes default minimum size.
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Tightens the tap area.
        ),
        onPressed: onPressed, // Executes the provided callback when pressed.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centers the content horizontally.
          children: [
            if (icon != null) // Displays the icon if provided.
              Icon(
                icon,
                size: fontSize + 2, // Scales the icon size relative to the font size.
                color: foregroundColor, // Matches the icon color with the text color.
              ),
            if (icon != null && label.isNotEmpty) 
              const SizedBox(width: 4), // Adds spacing between the icon and text.
            RichText(
              text: TextSpan(
                children: labelParts != null
                    ? labelParts!.entries.map((entry) {
                        // Formats each part of the label based on the bold specification.
                        return TextSpan(
                          text: entry.key,
                          style: TextStyle(
                            fontSize: fontSize, // Sets the font size.
                            fontWeight: entry.value ? FontWeight.bold : fontWeight, // Bold or normal based on specification.
                            color: foregroundColor, // Sets the text color.
                          ),
                        );
                      }).toList()
                    : [
                        // Defaults to a single text span if no parts are specified.
                        TextSpan(
                          text: label,
                          style: TextStyle(
                            fontSize: fontSize, // Sets the font size.
                            fontWeight: fontWeight, // Sets the default font weight.
                            color: foregroundColor, // Sets the text color.
                          ),
                        ),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
