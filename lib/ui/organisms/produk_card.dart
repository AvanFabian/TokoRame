import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';

/// A widget representing a product card, including an image, bookmark, price, stock, and a button.
class ProdukCard extends StatelessWidget {
  final String imagePath; // Path to the product image.
  final String buttonLabel; // Label for the bottom-left button on the image.
  final String boldText; // Bold text before the button label.
  final VoidCallback onButtonPressed; // Callback when the button is pressed.
  final String? bookmarkText; // Optional text for the bookmark.
  final String productName; // Name of the product.
  final String price; // Price of the product.
  final String stock; // Stock availability of the product.

  const ProdukCard({
    required this.imagePath,
    required this.buttonLabel,
    required this.boldText,
    required this.onButtonPressed,
    this.bookmarkText,
    required this.productName,
    required this.price,
    required this.stock,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Card background color.
      elevation: 0, // Removes elevation/shadow.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners.
      ),
      child: Column(
        children: [
          // Stack for image, bookmark, and button overlay.
          Stack(
            children: [
              // Product image with rounded top corners.
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Image scales to fit its container.
                  height: 160,
                  width: double.infinity,
                ),
              ),
              // Optional bookmark text positioned at the top-right corner.
              if (bookmarkText != null)
                Positioned(
                  top: 0,
                  right: 6,
                  child: Stack(
                    alignment: Alignment.center, // Centers text on the bookmark.
                    children: [
                      Image.asset(
                        'assets/images/Bookmark.png', // Bookmark background image.
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        bookmarkText!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              // Bottom-left button on the image.
              Positioned(
                bottom: 8,
                left: 8,
                child: SizedBox(
                  width: 100, // Adjusts button width.
                  child: ButtonWidget(
                    label: "",
                    labelParts: {
                      buttonLabel: false, // Regular text for the button label.
                      boldText: true, // Bold text before the button label.
                    },
                    onPressed: onButtonPressed,
                    backgroundColor: const Color(0xCC0EA5E9), // Button background color.
                    foregroundColor: Colors.white, // Button text color.
                    borderRadius: BorderRadius.circular(6), // Rounded button corners.
                    side: BorderSide.none, // No border around the button.
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Button padding.
                    fontSize: 10, // Font size for button text.
                  ),
                ),
              ),
            ],
          ),
          // Product details: name, price, and stock.
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product name.
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8), // Spacing between product name and details.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Reseller price label.
                    const Text(
                      "Harga Reseller",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF697170),
                      ),
                    ),
                    // Row for price and stock info.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children to edges.
                      children: [
                        // Product price.
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Stock information with an icon.
                        Row(
                          children: [
                            const Icon(
                              Icons.business_center,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2), // Spacing between icon and stock text.
                            Text(
                              stock,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // "Bagikan Produk" button below the product details.
          ButtonWidget(
            label: "Bagikan Produk",
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            side: BorderSide.none,
            onPressed: () {
              _showShareBottomSheet(context); // Calls the share bottom sheet function.
            },
          ),
        ],
      ),
    );
  }

  /// Displays a bottom sheet for sharing the product.
  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white, // Bottom sheet background color.
      barrierColor: Colors.black.withOpacity(0.7), // Blurs the main page.
      isScrollControlled: true, // Allows the sheet to take up more space.
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16), // Rounded top corners.
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 128.0, // Dynamic padding for keyboard.
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title row with a close icon.
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context); // Closes the bottom sheet.
                      },
                    ),
                    const Text(
                      "Bagikan Produk",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24), // Spacing between title and content.
                // Section: Teks dan Link
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity, // Ensure full width.
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE6E7E7),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Teks dan Link",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24), // Spacing between sections.
                // Section: Gambar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity, // Ensure full width.
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE6E7E7),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Gambar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
