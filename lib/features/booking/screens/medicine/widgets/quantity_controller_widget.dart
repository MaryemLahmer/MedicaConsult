import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class QuantityControllerWidget extends StatelessWidget {
  const QuantityControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
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
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.minus,
                      size: 16,
                      color: MedicaColors.white,
                    )),
              )),
          const SizedBox(
            width: MedicaSizes.sm,
          ),
          Text(
            "1",
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 16,
                      color: MedicaColors.white,
                    )),
              )),
        ],
      ),
    );
  }
}
