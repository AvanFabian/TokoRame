import 'package:flutter/material.dart';
import 'package:tokorame/ui/atoms/button_widget.dart';

class PriceInfo extends StatelessWidget {
  final String customerPrice;
  final String resellerPrice;
  final String commission;

  const PriceInfo({
    required this.customerPrice,
    required this.resellerPrice,
    required this.commission,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // margin: const EdgeInsets.only(top: 16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column 1
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rp$customerPrice",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Harga Konsumen",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const VerticalDivider(
              width: 36,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            // Column 2
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rp$resellerPrice",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Harga Reseller",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          // buttonwidget
          children: [
            Expanded(
              child: ButtonWidget(
                label: "Komisi",
                boldTextAfter: commission,
                backgroundColor: const Color(0xFFECE806),
                foregroundColor: const Color(0xFF363939),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                side: BorderSide.none,
                onPressed: () {
                  print("Beli Sekarang pressed");
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
