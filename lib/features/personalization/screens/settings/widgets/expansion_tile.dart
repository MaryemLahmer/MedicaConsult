import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/custom_shapes/divider.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class MedicaExpansionTile extends StatelessWidget {
  const MedicaExpansionTile({
    super.key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(
          top: MedicaSizes.xs * 2, left: MedicaSizes.md, right: MedicaSizes.md),
      childrenPadding: const EdgeInsets.only(
          left: MedicaSizes.md, bottom: MedicaSizes.md, right: MedicaSizes.md),
      title: Text(
        question,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      trailing: const Icon(
        Iconsax.arrow_bottom,
        color: MedicaColors.accent,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      children: [const MedicaDivider(), Text(answer)],
    );
  }
}
