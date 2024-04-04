import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class MiniTextFiled extends StatelessWidget {
  const MiniTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headlineSmall,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                top: MedicaSizes.lg * 1.2,
                left: MedicaSizes.lg * 1.2 * 1.1,
                bottom: 10),
            hintText: '-',
            hintStyle:
                const TextStyle(color: MedicaColors.darkGrey, fontSize: 25),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(color: MedicaColors.primary, width: 3)),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: MedicaColors.darkerGrey, width: 3),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: MedicaColors.primary),
            )),
      ),
    );
  }
}
