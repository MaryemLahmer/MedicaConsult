import 'package:flutter/material.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class MedicaDivider extends StatelessWidget {
  const MedicaDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? MedicaColors.grey : MedicaColors.darkerGrey,
          thickness: 0.5,
          indent: 40,
          endIndent: 40,
        ))
      ],
    );
  }
}
