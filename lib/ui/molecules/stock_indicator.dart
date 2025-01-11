import 'package:flutter/material.dart';

/// A widget that displays the stock availability of a product.
/// The word "Stok:" is displayed normally, and the actual stock value is bold.
class StockIndicator extends StatelessWidget {
  final String stock; // The stock quantity to display.

  /// Creates a [StockIndicator] widget.
  ///
  /// Requires [stock] to be a non-null string representing the stock quantity.
  const StockIndicator({required this.stock, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      // RichText allows for combining different styles in the same text.
      text: TextSpan(
        text: 'Stok: ', // Static text indicating the label for stock.
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black, // Normal text color.
            ),
        children: <TextSpan>[
          // TextSpan for the dynamic stock value with bold styling.
          TextSpan(
            text: stock, // Display the stock quantity dynamically.
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black, // Same color as the label.
                  fontWeight: FontWeight.bold, // Bold weight for emphasis.
                ),
          ),
        ],
      ),
    );
  }
}
