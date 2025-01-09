import 'package:flutter/material.dart';
import '../organisms/product_slider.dart';
import '../organisms/product_details.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the product page
    final List<String> images = [
      'assets/images/tesui1.png',
      'assets/images/tesui1.png',
      'assets/images/tesui1.png',
    ];

    final String title = "Beauty Set by Irvie";
    final String subtitle = "Irvie Group Official";
    final String description =
        "- New Material\nTebuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.\n\nSIZE CHART RELAXED SHIRT...";
    final String stock = "99+ pcs";
    final String customerPrice = "178.000";
    final String resellerPrice = "142.400";
    final String commission = "35.600 (20%)";

    final List<String> sizes = ["Paket 1", "Paket 2"];
    final List<Color> colors = [Colors.brown, Colors.grey];

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.share, color: Colors.black),
      //       onPressed: () {
      //         print('Share button pressed');
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ProductSlider(images: images),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50, // Responsif
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: ProductDetails(
                title: title,
                subtitle: subtitle,
                description: description,
                stock: stock,
                customerPrice: customerPrice,
                resellerPrice: resellerPrice,
                commission: commission,
                sizes: sizes,
                colors: colors,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            print("Tambah ke toko pressed");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Tambahkan ke toko",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
