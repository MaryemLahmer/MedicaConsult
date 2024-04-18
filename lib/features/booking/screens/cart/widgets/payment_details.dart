import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
    super.key,
    required this.subtotal,
    required this.taxes,
    required this.total,
  });

  final double subtotal;
  final double taxes;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Details",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodySmall),
            Text("\$$subtotal", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Taxes", style: Theme.of(context).textTheme.bodySmall),
            Text("\$$taxes", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: Theme.of(context).textTheme.bodyLarge),
            Text("\$${double.parse(total.toStringAsFixed(2))}",
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
