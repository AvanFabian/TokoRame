import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';

class CardImageOverlay extends StatelessWidget {
  final String imagePath;
  final String buttonLabel;
  final String boldText;
  final VoidCallback onButtonPressed;
  final String? bookmarkText;

  const CardImageOverlay({
    required this.imagePath,
    required this.buttonLabel,
    required this.boldText,
    required this.onButtonPressed,
    this.bookmarkText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(9),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 160,
            width: double.infinity,
          ),
        ),
        // Bottom-left button
        Positioned(
          bottom: 8,
          left: 8,
          child: SizedBox(
            width: 100,
            child: ButtonWidget(
              // label: buttonLabel,
              // boldTextBefore: boldText,
              label: "",
              labelParts: {
                buttonLabel: false,
                boldText: true,
              },
              onPressed: onButtonPressed,
              backgroundColor: const Color(0xCC0EA5E9),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(6),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              fontSize: 10,
            ),
          ),
        ),
        // Top-right bookmark
        if (bookmarkText != null)
          Positioned(
            top: 0,
            right: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/Bookmark.png',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                Text(
                  bookmarkText!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
