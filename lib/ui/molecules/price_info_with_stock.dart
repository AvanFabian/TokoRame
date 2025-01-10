import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/icon_with_text.dart';

class PriceInfoWithStock extends StatelessWidget {
  final String price;
  final String stock;

  const PriceInfoWithStock({
    required this.price,
    required this.stock,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Harga Reseller",
              style: TextStyle(fontSize: 10, color: Color(0xFF697170)),
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
        IconWithText(
          icon: Icons.shopping_cart,
          text: stock,
        ),
      ],
    );
  }
}
