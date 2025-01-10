import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductCardGrid extends StatelessWidget {
  final List<ProductCard> cards;

  const ProductCardGrid({required this.cards, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < cards.length; i += 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: cards[i]),
              if (i + 1 < cards.length) ...[
                const SizedBox(width: 16),
                Expanded(child: cards[i + 1]),
              ],
            ],
          ),
      ],
    );
  }
}
