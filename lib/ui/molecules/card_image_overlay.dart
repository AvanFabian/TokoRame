import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';

/// A reusable widget that overlays UI elements (such as a button and bookmark) on top of an image.
class CardImageOverlay extends StatelessWidget {
  final String imagePath; // Path to the image to be displayed.
  final String buttonLabel; // Label text for the button.
  final String boldText; // Bold text for the button (usually emphasized).
  final VoidCallback onButtonPressed; // Callback for the button press action.
  final String? bookmarkText; // Optional text to display in the bookmark.

  const CardImageOverlay({
    required this.imagePath,
    required this.buttonLabel,
    required this.boldText,
    required this.onButtonPressed,
    this.bookmarkText, // Bookmark is optional; it's displayed only if provided.
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main image displayed as the background of the card.
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(9), // Rounded corners at the top.
          ),
          child: Image.asset(
            imagePath, // Image source.
            fit: BoxFit.cover, // Ensures the image covers the container without distortion.
            height: 160, // Fixed height of the image.
            width: double.infinity, // Full width of the parent container.
          ),
        ),
        // Positioned button at the bottom-left corner of the card.
        Positioned(
          bottom: 8, // Distance from the bottom edge.
          left: 8, // Distance from the left edge.
          child: SizedBox(
            width: 100, // Fixed width for the button.
            child: ButtonWidget(
              // Button label with customizable bold and regular text parts.
              label: "",
              labelParts: {
                buttonLabel: false, // Regular text part.
                boldText: true, // Bold text part.
              },
              onPressed: onButtonPressed, // Action triggered when the button is pressed.
              backgroundColor: const Color(0xCC0EA5E9), // Semi-transparent blue background.
              foregroundColor: Colors.white, // White text color for the button.
              borderRadius: BorderRadius.circular(6), // Rounded corners for the button.
              side: BorderSide.none, // No border for the button.
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Tight padding around the button text.
              fontSize: 10, // Font size for the button text.
            ),
          ),
        ),
        // Optional bookmark displayed at the top-right corner of the card.
        if (bookmarkText != null)
          Positioned(
            top: 0, // Aligned to the top edge.
            right: 6, // Slightly inset from the right edge.
            child: Stack(
              alignment: Alignment.center, // Ensures the bookmark text is centered on the image.
              children: [
                // Bookmark icon/image displayed as the background.
                Image.asset(
                  'assets/images/Bookmark.png', // Path to the bookmark image.
                  height: 40, // Fixed height for the bookmark.
                  width: 40, // Fixed width for the bookmark.
                  fit: BoxFit.cover, // Ensures the bookmark image covers its container.
                ),
                // Text overlayed on the bookmark image.
                Text(
                  bookmarkText!, // Non-nullable as it's guarded by the `if` condition.
                  style: const TextStyle(
                    color: Colors.black, // Black text color.
                    fontSize: 10, // Small font size.
                    fontWeight: FontWeight.bold, // Bold text for emphasis.
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
