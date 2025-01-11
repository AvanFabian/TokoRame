import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label; // Main label text
  final Map<String, bool>? labelParts; // Label parts with bold specifications
  final IconData? icon; // Optional icon for the button
  final VoidCallback onPressed;
  final Color backgroundColor; // Custom background color
  final Color foregroundColor; // Custom text/icon color
  final FontWeight fontWeight; // Default font weight for non-bold text
  final BorderRadius borderRadius;
  final BorderSide side;
  final EdgeInsets padding; // Default padding
  final double fontSize; // Default font size

  const ButtonWidget({
    required this.label,
    this.labelParts, // Map of parts for custom text formatting
    required this.onPressed,
    this.icon, // Optional icon
    this.backgroundColor = Colors.black, // Default background color
    this.foregroundColor = Colors.white, // Default text/icon color
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
          foregroundColor: foregroundColor, // Custom text/icon color
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: side,
          ),
          padding: padding, // Padding
          minimumSize: Size.zero, // Removes default minimum size
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Tightens the tap area
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) // Render icon if provided
              Icon(
                icon,
                size: fontSize + 2, // Adjust icon size relative to font size
                color: foregroundColor,
              ),
            if (icon != null && label.isNotEmpty) const SizedBox(width: 4), // Spacing between icon and text
            RichText(
              text: TextSpan(
                children: labelParts != null
                    ? labelParts!.entries.map((entry) {
                        return TextSpan(
                          text: entry.key,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: entry.value ? FontWeight.bold : fontWeight,
                            color: foregroundColor,
                          ),
                        );
                      }).toList()
                    : [
                        TextSpan(
                          text: label,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                            color: foregroundColor,
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
