import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String buttonLabel;
  final String boldTextBefore;
  final VoidCallback onButtonPressed;
  final String? bookmarkText;
  final String productName;
  final String price;
  final String stock;

  const ProductCard({
    required this.imagePath,
    required this.buttonLabel,
    required this.boldTextBefore,
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
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 160,
                  width: double.infinity,
                ),
              ),
              if (bookmarkText != null)
                Positioned(
                  top: 0,
                  right: 6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Bookmark.png',
                        height: 40,
                        width: 40,
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
              Positioned(
                bottom: 8,
                left: 8,
                child: SizedBox(
                  width: 100,
                  child: ButtonWidget(
                    label: buttonLabel,
                    boldTextBefore: boldTextBefore,
                    onPressed: onButtonPressed,
                    backgroundColor: const Color(0xCC0EA5E9),
                    foregroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Harga Reseller",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF697170),
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          size: 16,
                          color: Colors.grey,
                        ),
                        Text(
                          stock,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonWidget(
            label: "Bagikan Produk",
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
            side: BorderSide.none,
            onPressed: () {
              _showShareBottomSheet(context); // Call the bottom sheet function
            },
          ),
        ],
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white.withOpacity(0.9),
      barrierColor: Colors.black.withOpacity(0.5), // Blurring the main page
      isScrollControlled: true, // Allows the sheet to take up more space
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Bagikan Produk",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.link, color: Colors.blue),
              title: const Text("Salin Tautan"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tautan telah disalin!")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.blue),
              title: const Text("Bagikan ke Media Sosial"),
              onTap: () {
                Navigator.pop(context);
                print("Bagikan ke media sosial");
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
