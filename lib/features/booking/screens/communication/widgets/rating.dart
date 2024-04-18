import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class Rating extends StatelessWidget {
  final double rating;
  const Rating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.0),
        child: Container(
          color: MedicaColors.accent.withOpacity(0.3),
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              const Icon(Icons.star, size: 10.0, color: MedicaColors.primary),
              Text(
                '$rating',
                style:
                    const TextStyle(fontSize: 9.0, color: MedicaColors.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
