import 'package:flutter/material.dart';
import '../atoms/text_widget.dart';
import '../atoms/button_widget.dart';
import '../molecules/slider_item.dart';

/// `SliderWithText` is a stateful widget that displays a slider of images with corresponding
/// titles and descriptions. It includes a button for actions and navigational dots 
/// indicating the current slide.
class SliderWithText extends StatefulWidget {
  final List<String> images; // List of image paths to display in the slider.
  final List<String> titles; // List of titles corresponding to each image.
  final List<String> descriptions; // List of descriptions corresponding to each image.
  final VoidCallback onButtonPressed; // Callback function for the button action.

  const SliderWithText({
    required this.images,
    required this.titles,
    required this.descriptions,
    required this.onButtonPressed,
    super.key,
  });

  @override
  _SliderWithTextState createState() => _SliderWithTextState();
}

class _SliderWithTextState extends State<SliderWithText> {
  int _currentIndex = 0; // Tracks the currently displayed slide index.

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content with slider and indicators.
        Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // PageView for image slider.
                  PageView.builder(
                    itemCount: widget.images.length, // Number of slides.
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index; // Update the current index on page change.
                      });
                    },
                    itemBuilder: (context, index) {
                      // Each slide is created using the SliderItem widget.
                      return Transform.translate(
                        offset: Offset(0, -MediaQuery.of(context).size.height * 0.174), 
                        // Shifts the slider upward by 17.4% of the screen height.
                        child: SliderItem(imagePath: widget.images[index]),
                      );
                    },
                  ),
                  // Skip button positioned at the top-right.
                  Positioned(
                    top: 48,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        // Action when "Skip" is tapped.
                      },
                      child: const Text(
                        'Lewati', // "Skip" text.
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF434747),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Navigational dots below the slider.
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.39, 
                    // Positioned 39% from the bottom of the screen.
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.images.length, // Number of dots based on the slides.
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2), // Spacing between dots.
                          width: _currentIndex == index ? 20 : 4, // Active dot is wider.
                          height: 4, // Dot height.
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white, // Dot color.
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Bottom content: Text and button container.
        Positioned(
          bottom: 0, // Positioned at the bottom of the screen.
          left: 0,
          right: 0,
          child: Container(
            height: 300, // Fixed height for the container.
            decoration: const BoxDecoration(
              color: Colors.white, // Background color.
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ), // Rounded corners at the top.
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space out elements evenly.
              children: [
                // Title text for the current slide.
                TextWidget(
                  text: widget.titles[_currentIndex], // Title for the current slide.
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.3, // Line height for better readability.
                      ),
                ),
                const SizedBox(height: 12), // Spacing between title and description.
                // Description text for the current slide.
                TextWidget(
                  text: widget.descriptions[_currentIndex], // Description for the current slide.
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: const Color(0xFF242626),
                        height: 1.5, // Line height for better readability.
                      ),
                ),
                const SizedBox(height: 24), // Spacing before the button.
                // Button to proceed to the next action.
                ButtonWidget(
                  label: 'Selanjutnya', // Button label ("Next").
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none, // No border.
                  onPressed: widget.onButtonPressed, // Calls the provided action.
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
