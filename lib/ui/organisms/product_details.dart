import 'package:flutter/material.dart';
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
          Text(
            title,
            // bold text
            // style: Theme.of(context).textTheme.headlineSmall,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          PriceInfo(
            customerPrice: customerPrice,
            resellerPrice: resellerPrice,
            commission: commission,
          ),
          const SizedBox(height: 16),
          SelectionOptions(
            sizes: sizes,
            colors: colors,
          ),
          const SizedBox(height: 16),
          StockIndicator(stock: stock),
          const SizedBox(height: 16),
          const Text(
            "Deskripsi",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(description),
        ],
      ),
    );
  }
}
