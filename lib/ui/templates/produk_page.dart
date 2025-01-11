import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';
import '../organisms/produk_slider.dart';
import '../organisms/produk_details.dart';

/// The `ProdukPage` widget represents a product page layout.
/// It contains a product image slider, product details, a persistent app bar, and a bottom navigation bar.
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

    const String title = "Beauty Set by Irvie";
    const String subtitle = "Irvie Group Official";
    const String description =
        "*New Material*\nTerbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.\nMenggunakan fit Relaxed Fit\n-\nSIZE CHART RELAXED SHIRT...";
    const String stock = "99+ pcs";
    const String customerPrice = "178.000";
    const String resellerPrice = "142.400";
    const String commission = "Rp35.600";

    final List<String> sizes = ["Paket 1", "Paket 2"];
    final List<Color> colors = [const Color(0xFFDDB69A), const Color(0xFF5B3E36)];

    return Scaffold(
      backgroundColor: Colors.white, // Set the page background color.
      body: Stack(
        children: [
          // Main content: Product image slider
          Column(
            children: [
              Expanded(
                child: ProdukSlider(images: images), // Displays a carousel of product images.
              ),
            ],
          ),
          // Product details container positioned at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50, // Occupies 50% of the screen height.
              decoration: const BoxDecoration(
                color: Colors.white, // Background color for the product details.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), // Rounded top-left corner.
                  topRight: Radius.circular(24), // Rounded top-right corner.
                ),
              ),
              child: ProdukDetails(
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
          // Persistent AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white.withOpacity(0.0), // Transparent background.
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button on the left
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to the previous page.
                        },
                      ),
                      // Action buttons on the right
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.file_download_outlined, color: Colors.white),
                            onPressed: () {
                              // Implement file download functionality here.
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart_sharp, color: Colors.white),
                            onPressed: () {
                              // Implement add-to-cart functionality here.
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0), // Adds padding around the bottom bar.
        child: Row(
          children: [
            // First button: "Tambahkan ke toko"
            Expanded(
              flex: 3,
              child: ButtonWidget(
                label: "Tambahkan ke toko",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16), // Adjust vertical padding.
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                side: const BorderSide(color: Colors.black), // Black border.
                onPressed: () {
                  // Implement "Add to store" functionality here.
                },
              ),
            ),
            const SizedBox(width: 16), // Spacing between buttons.
            // Second button: Shopping Cart icon
            Expanded(
              child: ButtonWidget(
                label: "", // No text label for the button.
                icon: Icons.shopping_cart, // Displays a shopping cart icon.
                onPressed: () {
                  // Implement "Go to Cart" functionality here.
                },
                backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Black background.
                foregroundColor: Colors.white, // White icon color.
                borderRadius: BorderRadius.circular(8),
                side: BorderSide.none, // No border.
                padding: const EdgeInsets.all(16), // Adjust padding for the icon.
                fontSize: 16, // Font size for consistent icon sizing.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
