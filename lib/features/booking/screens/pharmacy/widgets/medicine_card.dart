import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class MedicineCard extends StatelessWidget {
  final String medicineImage;
  final String name;
  final String type;
  final int quantity;
  final double price;
  final double rating;
  final String description;
  final int sale;
  final VoidCallback onPressed;

  const MedicineCard({
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
    print(sale);
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 172.0,
        width: 134.0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: MedicaSizes.sm, right: MedicaSizes.sm),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      width: MedicaSizes.imageThumbSize * 0.9,
                      height: MedicaSizes.imageThumbSize * 0.9,
                      image: AssetImage(medicineImage),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: MedicaSizes.xs,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                            type == 'liquid'
                                ? '$quantity' 'ml'
                                : '$quantity' 'pcs',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "\$" '$price',
                                  style: sale != 0
                                      ? const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        )
                                      : const TextStyle(),
                                ),
                                sale != 0
                                    ? Text(
                                        "\$" '${double.parse((price - price * sale * 0.01).toStringAsFixed(2))}',
                                      )
                                    : const SizedBox(),
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
                                    icon: const Icon(Icons.add),
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
