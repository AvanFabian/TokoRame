import 'package:flutter/material.dart';

class StockIndicator extends StatelessWidget {
  final String stock;

  const StockIndicator({required this.stock, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Stok: ',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black,
            ),
        children: <TextSpan>[
          TextSpan(
            text: stock,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
