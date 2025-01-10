import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';
import 'package:tokorame/ui/organisms/product_card.dart';
import '../molecules/price_info.dart';
import '../molecules/selection_options.dart';
import '../molecules/stock_indicator.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String stock;
  final String customerPrice;
  final String resellerPrice;
  final String commission;
  final List<String> sizes;
  final List<Color> colors;

  const ProductDetails({
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
          // First container: Title, Subtitle, PriceInfo
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            margin: const EdgeInsets.only(bottom: 16, top: 16), // Add margin for spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for Button and Share Icon
                Row(
                  children: [
                    Flexible(
                      child: ButtonWidget(
                        label: "Product Baru",
                        boldTextBefore: "NEW",
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
                    const Spacer(), // Dynamically increases space between button and icon
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 16), // Add spacing below the Row
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                PriceInfo(
                  customerPrice: customerPrice,
                  resellerPrice: resellerPrice,
                  commission: commission,
                ),
              ],
            ),
          ),

          // Second container: SelectionOptions and StockIndicator
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16), // Add margin for spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectionOptions(
                  sizes: sizes,
                  colors: colors,
                ),
                const SizedBox(height: 16),
                StockIndicator(stock: stock),
              ],
            ),
          ),

          // Description Section wrapped in a container
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Deskripsi",
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
                        Clipboard.setData(const ClipboardData(text: "Deskripsi"));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Deskripsi copied to clipboard!"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Add spacing between the row and text
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16), // Spacing between description and row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selengkapnya",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue, // Example color for link
                      ),
                    ),
                    SizedBox(width: 4), // Add spacing between text and icon
                    Icon(Icons.keyboard_arrow_down_sharp, color: Colors.blue), // Downward arrow icon
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Fourth Container Implementation
          // Grid of 4 cards (2x2 layout)
          // Title above the first row
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Produk lain dari Irvie group official",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // First Row of Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProductCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldTextBefore: '30%',
                    onButtonPressed: () {},
                    productName: 'Beauty Set by Irvie',
                    price: 'Rp142.400',
                    stock: '99+ pcs',
                  ),
                ),
                const SizedBox(width: 16), // Spacing between cards
                Expanded(
                  child: ProductCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldTextBefore: '25%',
                    onButtonPressed: () {},
                    bookmarkText: 'New',
                    productName: 'Daily Skincare',
                    price: 'Rp120.000',
                    stock: '50 pcs',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16), // Spacing between the first and second row

          // Title above the second row
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Produk Serupa",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Second Row of Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProductCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldTextBefore: '20%',
                    onButtonPressed: () {},
                    bookmarkText: 'New',
                    productName: 'Moisturizer Pack',
                    price: 'Rp100.000',
                    stock: '70 pcs',
                  ),
                ),
                const SizedBox(width: 16), // Spacing between cards
                Expanded(
                  child: ProductCard(
                    imagePath: 'assets/images/PexelsPhotobyLukas.png',
                    buttonLabel: 'Komisi',
                    boldTextBefore: '15%',
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
