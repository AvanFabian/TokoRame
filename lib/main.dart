import 'package:flutter/material.dart';
import 'ui/pages/section1_screen.dart'; // Import file OnboardingScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tokorame',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Section1Screen(), // Ganti halaman utama ke Section1Screen
      debugShowCheckedModeBanner: false,
    );
  }
}
