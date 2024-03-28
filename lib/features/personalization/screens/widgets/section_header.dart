import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  final VoidCallback action;

  const SectionHeader({super.key, required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: MedicaSizes.sm,
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: action,
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  "See all",
                  style: TextStyle(color: MedicaColors.primary),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: MedicaSizes.sm,
        ),
      ],
    );
  }
}
