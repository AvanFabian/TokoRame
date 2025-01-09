import 'package:flutter/material.dart';
import '../atoms/text_widget.dart';
import '../atoms/button_widget.dart';

class SliderWithText extends StatefulWidget {
  final List<String> images;
  final List<String> titles; // Tambahkan daftar judul
  final List<String> descriptions; // Tambahkan daftar deskripsi
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
  int _currentIndex = 0; // Untuk melacak slider aktif

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
                      return Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    top: 48, // Posisi teks 'Lewati' di kanan atas
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        // Handle aksi 'Lewati'
                        print('Lewati ditekan');
                      },
                      child: const Text(
                        'Lewati',
                        style: TextStyle(
                          fontSize: 16,
                          // hex
                          color: Color(0xFF434747),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16, // Posisi indikator di bawah gambar
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.images.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentIndex == index ? 12 : 8,
                          height: _currentIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(2),
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: 72,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    onPressed: widget.onButtonPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
