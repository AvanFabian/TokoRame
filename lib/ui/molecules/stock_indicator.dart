import 'package:flutter/material.dart';

class StockIndicator extends StatelessWidget {
  final String stock;

  const StockIndicator({required this.stock, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Stock: $stock",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
    );
  }
}
