import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';
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

// Fourth Container Implementation
          Container(
            padding: const EdgeInsets.all(16), // Inner padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading Text
                const Text(
                  "Produk lain dari Irvie group official",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16), // Spacing below heading
                // Nested Column for Rows
                Column(
                  children: [
                    // First Row of Cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.white, // Make the card background transparent
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                // Stack for the image and button overlay
                                Stack(
                                  children: [
                                    // Image
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(9),
                                      ),
                                      child: Image.asset(
                                        'assets/images/PexelsPhotobyLukas.png',
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: double.infinity,
                                      ),
                                    ),
                                    // ButtonWidget on the bottom-left corner
                                    Positioned(
                                      bottom: 8, // Adjust the vertical position
                                      left: 8, // Adjust the horizontal position
                                      child: SizedBox(
                                        width: 100, // Adjust width as needed
                                        child: ButtonWidget(
                                          label: "Komisi", // Regular text
                                          boldTextBefore: "30%", // Bold text before
                                          onPressed: () {
                                            print("30% Komisi button clicked");
                                          },
                                          backgroundColor: const Color(0xCC0EA5E9), // Background color
                                          foregroundColor: Colors.white, // Text color
                                          borderRadius: BorderRadius.circular(6), // Rounded corners
                                          side: BorderSide.none, // No border
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Tight padding
                                          fontSize: 10, // Font size
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Product Name
                                      Text(
                                        "Beauty Set by Irvie",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8), // Spacing between product name and price
                                      // Row containing "Harga Reseller" and price with icon
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Column for "Harga Reseller" and "Rp142.400"
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Harga Reseller",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF697170),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Rp142.400",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.green,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 16), // Spacing between price and icon
                                                  Row(
                                                    children: [
                                                      // Icon for "99+ pcs"
                                                      Icon(
                                                        Icons.shopping_cart,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                      // Text for "99+ pcs"
                                                      Text(
                                                        "99+ pcs",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // ButtonWidget
                                ButtonWidget(
                                  label: "Bagikan Produk",
                                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none,
                                  onPressed: () {
                                    print("Bagikan Produk pressed");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // second card
                        const SizedBox(width: 16), // Spacing between cards
                        Expanded(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                // Stack for the image, button overlay, and bookmark banner
                                Stack(
                                  children: [
                                    // Image
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(9),
                                      ),
                                      child: Image.asset(
                                        'assets/images/PexelsPhotobyLukas.png',
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: double.infinity,
                                      ),
                                    ),
                                    // ButtonWidget on the bottom-left corner
                                    Positioned(
                                      bottom: 8, // Adjust the vertical position
                                      left: 8, // Adjust the horizontal position
                                      child: SizedBox(
                                        width: 100, // Adjust width as needed
                                        child: ButtonWidget(
                                          label: "Komisi", // Regular text
                                          boldTextBefore: "30%", // Bold text before
                                          onPressed: () {
                                            print("30% Komisi button clicked");
                                          },
                                          backgroundColor: const Color(0xCC0EA5E9), // Background color
                                          foregroundColor: Colors.white, // Text color
                                          borderRadius: BorderRadius.circular(6), // Rounded corners
                                          side: BorderSide.none, // No border
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Tight padding
                                          fontSize: 10, // Font size
                                        ),
                                      ),
                                    ),
                                    // Bookmark banner with image
                                    Positioned(
                                      top: 0, // Adjust vertical position
                                      right: 6, // Adjust horizontal position
                                      child: Stack(
                                        alignment: Alignment.center, // Center the text on the banner
                                        children: [
                                          // Bookmark banner image
                                          Image.asset(
                                            'assets/images/Bookmark.png', // Replace with your banner image
                                            height: 40, // Adjust the height as needed
                                            width: 40, // Adjust the width as needed
                                            fit: BoxFit.cover,
                                          ),
                                          // "New" text overlayed on the banner image
                                          const Text(
                                            "New",
                                            style: TextStyle(
                                              color: Colors.black, // Text color
                                              fontSize: 10, // Font size
                                              fontWeight: FontWeight.bold, // Bold text
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Card content below the image
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Product Name
                                      Text(
                                        "Beauty Set by Irvie",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8), // Spacing between product name and price
                                      // Row containing "Harga Reseller" and price with icon
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Column for "Harga Reseller" and "Rp142.400"
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Harga Reseller",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF697170),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Rp142.400",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.green,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 16), // Spacing between price and icon
                                                  Row(
                                                    children: [
                                                      // Icon for "99+ pcs"
                                                      Icon(
                                                        Icons.shopping_cart,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                      // Text for "99+ pcs"
                                                      Text(
                                                        "99+ pcs",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // ButtonWidget
                                ButtonWidget(
                                  label: "Bagikan Produk",
                                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none,
                                  onPressed: () {
                                    print("Bagikan Produk pressed");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), // Spacing between rows

                    // Second Row of Cards (Duplicate the first row for simplicity)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                // Stack for the image, button overlay, and bookmark banner
                                Stack(
                                  children: [
                                    // Image
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(9),
                                      ),
                                      child: Image.asset(
                                        'assets/images/PexelsPhotobyLukas.png',
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: double.infinity,
                                      ),
                                    ),
                                    // ButtonWidget on the bottom-left corner
                                    Positioned(
                                      bottom: 8, // Adjust the vertical position
                                      left: 8, // Adjust the horizontal position
                                      child: SizedBox(
                                        width: 100, // Adjust width as needed
                                        child: ButtonWidget(
                                          label: "Komisi", // Regular text
                                          boldTextBefore: "30%", // Bold text before
                                          onPressed: () {
                                            print("30% Komisi button clicked");
                                          },
                                          backgroundColor: const Color(0xCC0EA5E9), // Background color
                                          foregroundColor: Colors.white, // Text color
                                          borderRadius: BorderRadius.circular(6), // Rounded corners
                                          side: BorderSide.none, // No border
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Tight padding
                                          fontSize: 10, // Font size
                                        ),
                                      ),
                                    ),
                                    // Bookmark banner with image
                                    Positioned(
                                      top: 0, // Adjust vertical position
                                      right: 6, // Adjust horizontal position
                                      child: Stack(
                                        alignment: Alignment.center, // Center the text on the banner
                                        children: [
                                          // Bookmark banner image
                                          Image.asset(
                                            'assets/images/Bookmark.png', // Replace with your banner image
                                            height: 40, // Adjust the height as needed
                                            width: 40, // Adjust the width as needed
                                            fit: BoxFit.cover,
                                          ),
                                          // "New" text overlayed on the banner image
                                          const Text(
                                            "New",
                                            style: TextStyle(
                                              color: Colors.black, // Text color
                                              fontSize: 10, // Font size
                                              fontWeight: FontWeight.bold, // Bold text
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // Card content below the image
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Product Name
                                      Text(
                                        "Beauty Set by Irvie",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8), // Spacing between product name and price
                                      // Row containing "Harga Reseller" and price with icon
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Column for "Harga Reseller" and "Rp142.400"
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Harga Reseller",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF697170),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Rp142.400",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.green,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 16), // Spacing between price and icon
                                                  Row(
                                                    children: [
                                                      // Icon for "99+ pcs"
                                                      Icon(
                                                        Icons.shopping_cart,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                      // Text for "99+ pcs"
                                                      Text(
                                                        "99+ pcs",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // ButtonWidget
                                ButtonWidget(
                                  label: "Bagikan Produk",
                                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none,
                                  onPressed: () {
                                    print("Bagikan Produk pressed");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                // Stack for the image and button overlay
                                Stack(
                                  children: [
                                    // Image
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(9),
                                      ),
                                      child: Image.asset(
                                        'assets/images/PexelsPhotobyLukas.png',
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: double.infinity,
                                      ),
                                    ),
                                    // ButtonWidget on the bottom-left corner
                                    Positioned(
                                      bottom: 8, // Adjust the vertical position
                                      left: 8, // Adjust the horizontal position
                                      child: SizedBox(
                                        width: 100, // Adjust width as needed
                                        child: ButtonWidget(
                                          label: "Komisi", // Regular text
                                          boldTextBefore: "30%", // Bold text before
                                          onPressed: () {
                                            print("30% Komisi button clicked");
                                          },
                                          backgroundColor: const Color(0xCC0EA5E9), // Background color
                                          foregroundColor: Colors.white, // Text color
                                          borderRadius: BorderRadius.circular(6), // Rounded corners
                                          side: BorderSide.none, // No border
                                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2), // Tight padding
                                          fontSize: 10, // Font size
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Product Name
                                      Text(
                                        "Beauty Set by Irvie",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8), // Spacing between product name and price
                                      // Row containing "Harga Reseller" and price with icon
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Column for "Harga Reseller" and "Rp142.400"
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Harga Reseller",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF697170),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Rp142.400",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.green,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 16), // Spacing between price and icon
                                                  Row(
                                                    children: [
                                                      // Icon for "99+ pcs"
                                                      Icon(
                                                        Icons.shopping_cart,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                      // Text for "99+ pcs"
                                                      Text(
                                                        "99+ pcs",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // ButtonWidget
                                ButtonWidget(
                                  label: "Bagikan Produk",
                                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide.none,
                                  onPressed: () {
                                    print("Bagikan Produk pressed");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
