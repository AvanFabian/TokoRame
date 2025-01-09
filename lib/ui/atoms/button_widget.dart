import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonWidget({required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Membuat tombol full width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, // Latar belakang hitam
          foregroundColor: Colors.white, // Teks putih
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Sudut tombol membulat
          ),
          padding: const EdgeInsets.symmetric(vertical: 12), // Padding vertikal
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16, // Ukuran font teks
            fontWeight: FontWeight.bold, // Teks tebal
          ),
        ),
      ),
    );
  }
}
