import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label; // Main label text
  final String? boldTextBefore; // Bold text before the label
  final String? boldTextAfter; // Bold text after the label
  final VoidCallback onPressed;
  final Color backgroundColor; // Custom background color
  final Color foregroundColor; // Custom text color
  final FontWeight fontWeight; // Default font weight for non-bold text
  final BorderRadius borderRadius;
  final BorderSide side;
  final EdgeInsets padding; // Default padding
  final double fontSize; // Default font size

  const ButtonWidget({
    required this.label,
    required this.onPressed,
    this.boldTextBefore, // Optional bold text before the label
    this.boldTextAfter, // Optional bold text after the label
    this.backgroundColor = Colors.black, // Default background color
    this.foregroundColor = Colors.white, // Default text color
    this.fontWeight = FontWeight.normal, // Default font weight
    required this.borderRadius, // Default border radius
    required this.side,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.fontSize = 16, // Default font size
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full-width button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Custom background color
          foregroundColor: foregroundColor, // Custom text color
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: side,
          ),
          padding: padding, // Padding
          minimumSize: Size.zero, // Removes default minimum size
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Tightens the tap area
        ),
        onPressed: onPressed,
        child: RichText(
          text: TextSpan(
            children: [
              // Bold text before the label (optional)
              if (boldTextBefore != null)
                TextSpan(
                  text: '$boldTextBefore ', // Add space after bold text
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: foregroundColor,
                  ),
                ),
              // Main label text
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: foregroundColor,
                ),
              ),
              // Bold text after the label (optional)
              if (boldTextAfter != null)
                TextSpan(
                  text: ' $boldTextAfter', // Add space before bold text
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: foregroundColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
