import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';
import 'package:tokorame/ui/organisms/produk_card.dart';
import '../molecules/price_info.dart';
import '../molecules/selection_options.dart';
import '../molecules/stock_indicator.dart';

/// The `ProdukDetails` widget displays detailed information about a product,
/// including title, price, description, stock, and options like sizes and colors.
/// It also showcases related and similar products in a 2x2 card grid layout.
class ProdukDetails extends StatelessWidget {
  final String title; // The main title of the product.
  final String subtitle; // Subtitle or additional details about the product.
  final String description; // Product description.
  final String stock; // Current stock information.
  final String customerPrice; // Price for customers.
  final String resellerPrice; // Price for resellers.
  final String commission; // Commission details for resellers.
  final List<String> sizes; // Available sizes for the product.
  final List<Color> colors; // Available color options for the product.

  const ProdukDetails({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.stock,
    required this.customerPrice,
    required this.resellerPrice,
    required this.commission,
    required this.sizes,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First container: Displays title, subtitle, and pricing information.
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            margin: const EdgeInsets.only(bottom: 16, top: 16), // Adds margin for spacing.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row containing a "NEW" button and a share icon.
                Row(
                  children: [
                    Flexible(
                      child: ButtonWidget(
                        label: " ",
                        labelParts: const {
                          "NEW ": true,
                          "Product Baru": false,
                        },
                        onPressed: () {},
                        backgroundColor: const Color(0xFFECE806),
                        foregroundColor: Colors.black,
                        fontWeight: FontWeight.normal,
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide.none,
                        fontSize: 14,
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                      ),
                    ),
                    const Spacer(), // Adds spacing between button and icon.
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {}, // Placeholder for share functionality.
                    ),
                  ],
                ),

                const SizedBox(height: 16), // Spacing below the Row.
                Text(
                  title, // Displays the main product title.
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle, // Displays the product subtitle.
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                PriceInfo(
                  customerPrice: customerPrice, // Displays customer price.
                  resellerPrice: resellerPrice, // Displays reseller price.
                  commission: commission, // Displays commission details.
                ),
              ],
            ),
          ),

          // Second container: Displays selection options (sizes, colors) and stock indicator.
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16), // Adds margin for spacing.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectionOptions(
                  sizes: sizes, // Dropdown or buttons for size selection.
                  colors: colors, // Color options displayed as swatches.
                ),
                const SizedBox(height: 16),
                StockIndicator(stock: stock), // Displays stock availability.
              ],
            ),
          ),

          // Description section wrapped in a styled container.
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row with a copy icon.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Deskripsi", // Section title.
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF242626),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy, color: Colors.grey),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Spacing between the row and text.
                Text(
                  description, // Displays the product description.
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16), // Spacing between description and row.
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selengkapnya", // "Read more" text.
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue, // Styled as a link.
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down_sharp, color: Colors.blue), // Downward arrow icon.
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Section: Other products from the official group.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Produk lain dari Irvie group official", // Section title.
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // First row of product cards.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProdukCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldText: '30%',
                    onButtonPressed: () {}, // Action on button press.
                    productName: 'Beauty Set by Irvie',
                    price: 'Rp142.400',
                    stock: '99+ pcs',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ProdukCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldText: '25%',
                    onButtonPressed: () {},
                    bookmarkText: 'New', // Bookmark with "New" text.
                    productName: 'Daily Skincare',
                    price: 'Rp120.000',
                    stock: '50 pcs',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Section: Similar products.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Produk Serupa", // Section title.
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Second row of product cards.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProdukCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldText: '20%',
                    onButtonPressed: () {},
                    bookmarkText: 'New',
                    productName: 'Moisturizer Pack',
                    price: 'Rp100.000',
                    stock: '70 pcs',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ProdukCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldText: '15%',
                    onButtonPressed: () {},
                    productName: 'Essential Oils',
                    price: 'Rp90.000',
                    stock: '30 pcs',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
