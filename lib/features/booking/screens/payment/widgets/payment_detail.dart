import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          children: [
            Expanded(
                child: Text(
              'SubTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            Text(
              '\$60.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems / 2,
        ),

        /// Shipping Fee
        Row(
          children: [
            Expanded(
                child: Text(
              'Admin Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
            Text(
              '\$3.0',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),

        const SizedBox(
          height: MedicaSizes.spaceBetweenItems / 2,
        ),

        /// Order Total
        Row(
          children: [
            Expanded(
                child: Text(
              'Total',
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            Text(
              '\$63.0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
