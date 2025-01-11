import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';

/// A reusable widget that displays price information for customers and resellers, 
/// along with a commission button.
class PriceInfo extends StatelessWidget {
  final String customerPrice; // The price for the customer.
  final String resellerPrice; // The price for the reseller.
  final String commission; // The commission amount.

  const PriceInfo({
    required this.customerPrice,
    required this.resellerPrice,
    required this.commission,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Align children in the center.
      children: [
        // Row displaying customer and reseller prices with a divider in between.
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align the row.
          crossAxisAlignment: CrossAxisAlignment.center, // Align children vertically in the center.
          children: [
            // Column for displaying customer price and label.
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center align the text.
              children: [
                // Customer price.
                Text(
                  "Rp$customerPrice",
                  style: const TextStyle(
                    fontSize: 16, // Font size for price.
                    fontWeight: FontWeight.bold, // Bold font for emphasis.
                  ),
                ),
                // Label for customer price.
                const Text(
                  "Harga Konsumen",
                  style: TextStyle(
                    fontSize: 14, // Font size for label.
                    color: Color(0xFF697170), // Grayish text color.
                  ),
                ),
              ],
            ),
            // Vertical divider between customer and reseller prices.
            const SizedBox(
              height: 40, // Set the height for the divider.
              child: VerticalDivider(
                width: 36, // Horizontal spacing between columns.
                thickness: 1, // Divider thickness.
                color: Color(0xFF697170), // Divider color.
              ),
            ),
            // Column for displaying reseller price and label.
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center align the text.
              children: [
                // Reseller price.
                Text(
                  "Rp$resellerPrice",
                  style: const TextStyle(
                    fontSize: 16, // Font size for price.
                    fontWeight: FontWeight.bold, // Bold font for emphasis.
                  ),
                ),
                // Label for reseller price.
                const Text(
                  "Harga Reseller",
                  style: TextStyle(
                    fontSize: 14, // Font size for label.
                    color: Color(0xFF697170), // Grayish text color.
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16), // Spacing between the price section and the button.

        // Row containing the commission button.
        Row(
          mainAxisSize: MainAxisSize.min, // Minimize the row's width.
          children: [
            // Button displaying commission information.
            Expanded(
              child: ButtonWidget(
                label: "", // Leave label empty as labelParts are used.
                labelParts: {
                  "Komisi ": false, // Regular text.
                  commission: true, // Bold text for commission.
                  " (20%)": false, // Regular text.
                },
                backgroundColor: const Color(0xFFECE806), // Yellow background for the button.
                foregroundColor: const Color(0xFF363939), // Dark text color for the button.
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8), // Rounded corner on the bottom-left.
                  bottomRight: Radius.circular(8), // Rounded corner on the bottom-right.
                ),
                side: BorderSide.none, // No border for the button.
                onPressed: () {
                  // Define what happens when the button is pressed.
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
