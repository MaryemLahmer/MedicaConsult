import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class SectionHeader extends StatelessWidget {
  final String text;

  const SectionHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

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
                onPressed: () {},
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
