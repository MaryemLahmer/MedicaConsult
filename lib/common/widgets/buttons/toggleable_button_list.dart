import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'color_changing_button.dart';

class ToggleableButtonList extends StatelessWidget {
  const ToggleableButtonList(
      {super.key,
      this.options = const ['General', 'Account', 'Service', 'Payment']});

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            return Row(
              children: [
                ColorChangingElevatedButton(
                    text: options[i++],
                    activeColor: MedicaColors.primary,
                    inactiveColor: MedicaColors.white),
                const SizedBox(
                  width: MedicaSizes.xs,
                ),
              ],
            );
          }),
    );
  }
}
