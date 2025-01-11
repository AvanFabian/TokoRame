import 'package:flutter/material.dart';
import 'package:tokorame/ui/pages/produk_screen.dart';
import '../organisms/section1_slider_with_text.dart';

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
          'Gratis Materi Belajar \n Menjadi Seller Handal',
          'Ribuan Produk dengan \n Kualitas Terbaik',
          'Toko Online Unik \n Untuk Kamu Jualan',
        ],
        descriptions: const [
          'Nggak bisa jualan? \n Jangan khawatir, Tokorame akan membimbing kamu \n hingga menjadi seller langsung dari ahlinya',
          'Tokorame menyediakan ribuan produk dengan kualitas \n derbaik dari seller terpercaya',
          'Subdomain unik dan toko online profesional \n siap pakai',
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
