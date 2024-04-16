import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/features/booking/screens/communication/widgets/rating.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class MedicineHorizontalCard extends StatelessWidget {
  final String medicineImage;
  final String name;
  final String type;
  final int quantity;
  final double price;
  final double rating;
  final String description;
  final int sale;
  final VoidCallback onPressed;

  const MedicineHorizontalCard({
    super.key,
    required this.medicineImage,
    required this.type,
    required this.name,
    required this.quantity,
    required this.price,
    required this.rating,
    required this.description,
    this.sale = 0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 110.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: MedicaSizes.xs, bottom: MedicaSizes.xs),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: MedicaColors.accent,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(MedicaSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          width: MedicaSizes.imageThumbSize * 0.9,
                          height: MedicaSizes.imageThumbSize * 0.9,
                          image: AssetImage(medicineImage),
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: MedicaSizes.sm,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text(
                                type == 'liquid'
                                    ? '$quantity' + 'ml'
                                    : '$quantity' + 'pcs',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "\$" + '${price}',
                                  style: sale != 0
                                      ? const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        )
                                      : const TextStyle(),
                                ),
                                sale != 0
                                    ? Text(
                                        "\$" +
                                            '${double.parse((price - price * sale * 0.01).toStringAsFixed(2))}',
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: Container(
                            color: MedicaColors.primary,
                            height: 28,
                            width: 28,
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.add),
                                iconSize: 12,
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
