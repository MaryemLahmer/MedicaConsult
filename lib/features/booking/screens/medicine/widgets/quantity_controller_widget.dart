import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class QuantityControllerWidget extends StatefulWidget {
  final int quantity;

  const QuantityControllerWidget({
    super.key,
    this.quantity = 1,
  });

  @override
  _QuantityControllerWidgetState createState() =>
      _QuantityControllerWidgetState();
}

class _QuantityControllerWidgetState extends State<QuantityControllerWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: 30,
            height: 32,
            decoration: BoxDecoration(
              color: quantity == 1 ? MedicaColors.grey : MedicaColors.primary,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: quantity > 1 ? decrementQuantity : null,
                icon: const Icon(
                  Iconsax.minus,
                  size: 16,
                  color: MedicaColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: MedicaSizes.sm,
          ),
          Text(
            quantity.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            width: MedicaSizes.sm,
          ),
          Container(
            width: 30,
            height: 32,
            decoration: BoxDecoration(
              color: MedicaColors.primary,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: incrementQuantity,
                icon: const Icon(
                  Icons.add,
                  size: 16,
                  color: MedicaColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      quantity = quantity > 0 ? quantity - 1 : 0;
    });
  }
}
