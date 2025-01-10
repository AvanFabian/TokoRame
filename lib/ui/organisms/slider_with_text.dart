import 'package:flutter/material.dart';
import '../atoms/text_widget.dart';
import '../atoms/button_widget.dart';
import '../molecules/slider_item.dart';
class SliderWithText extends StatefulWidget {
  final List<String> images;
  final List<String> titles;
  final List<String> descriptions;
  final VoidCallback onButtonPressed;

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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Transform.translate(
                        offset: Offset(0, -MediaQuery.of(context).size.height * 0.174), // 20% of screen height
                        child: SliderItem(imagePath: widget.images[index]),
                      );
                    },
                  ),
                  Positioned(
                    top: 48,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        print('Lewati ditekan');
                      },
                      child: const Text(
                        'Lewati',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF434747),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.39, // 40% dari tinggi layar
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.images.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: _currentIndex == index ? 20 : 4,
                          height: _currentIndex == index ? 4 : 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white,
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
        Positioned(
          bottom: 0, // Position the container at the bottom of the Stack
          left: 0,
          right: 0,
          child: Container(
            height: 300, // Fixed height for the container
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(
                  text: widget.titles[_currentIndex],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                ),
                const SizedBox(height: 12),
                TextWidget(
                  text: widget.descriptions[_currentIndex],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  label: 'Selanjutnya',
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide.none,
                  onPressed: widget.onButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
