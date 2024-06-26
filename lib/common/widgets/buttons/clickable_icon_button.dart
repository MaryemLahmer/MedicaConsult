import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class ClickableIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ClickableIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: MedicaColors.primary,
                size: 40,
              ),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              Text(
                text,
                style: const TextStyle(
                  color: MedicaColors.textSecondary,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}
