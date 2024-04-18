import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/booking/screens/medicine/widgets/quantity_controller_widget.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class MedicineHorizontalCard extends StatefulWidget {
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
  _MedicineHorizontalCardState createState() => _MedicineHorizontalCardState();
}

class _MedicineHorizontalCardState extends State<MedicineHorizontalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding:
            const EdgeInsets.only(top: MedicaSizes.xs, bottom: MedicaSizes.xs),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MedicaSizes.sm),
            border: Border.all(color: MedicaColors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: 80,
                  image: AssetImage(widget.medicineImage),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          widget.type == 'liquid'
                              ? '${widget.quantity}' + 'ml'
                              : '${widget.quantity}' + 'pcs',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    QuantityControllerWidget(
                      quantity: widget.quantity,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.trash),
                    ),
                    Text(
                      "\$${widget.price * widget.quantity}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
