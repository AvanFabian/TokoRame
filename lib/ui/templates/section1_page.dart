import 'package:flutter/material.dart';
import 'package:tokorame/ui/pages/produk_screen.dart';
import '../organisms/slider_with_text.dart';

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderWithText(
        images: const [
          'assets/images/PexelsPhotobyLukas.png',
          'assets/images/PexelsPhotobyKarolinaGrabowska.png',
          'assets/images/PexelsPhotobyKampusProduction.png',
        ],
        titles: const [
          'Gratis Materi Belajar Menjadi Seller Handal',
          'Ribuan Produk dengan Kualitas Terbaik',
          'Toko Online Unik Untuk Kamu Jualan',
        ],
        descriptions: const [
          'Nggak bisa jualan? Jangan khawatir, Tokorame akan membimbing kamu hingga menjadi seller langsung dari ahlinya',
          'Tokorame menyediakan ribuan produk dengan kualitas derbaik dari seller terpercaya',
          'Subdomain unik dan toko online profesional siap pakai',
        ],
        onButtonPressed: () {
          // navigate to ProdukScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProdukScreen(),
            ),
          );
        },
      ),
    );
  }
}
