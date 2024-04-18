import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/maps/maps.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class Address extends StatelessWidget {
  const Address({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Address", style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "123 Ariana",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            TextButton(
              onPressed: () => Get.to(() => MapScreen()),
              child: const Text(
                "Change",
                style: TextStyle(color: MedicaColors.darkGrey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
