import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Method",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MedicaSizes.sm),
            border: Border.all(color: MedicaColors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.sm),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage(MedicaImages.visa),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Change",
                      style: TextStyle(color: MedicaColors.darkGrey),
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
