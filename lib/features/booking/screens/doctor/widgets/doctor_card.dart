import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/features/booking/screens/communication/widgets/rating.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class DoctorCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String speciality;
  final double rating;
  final double distance;
  final VoidCallback onPressed;

  const DoctorCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.distance,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 164.0,
        width: 134.0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: MedicaSizes.sm, right: MedicaSizes.sm),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: MedicaColors.accent,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(MedicaSizes.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(MedicaSizes.imageThumbSize / 2),
                      child: Image(
                        width: MedicaSizes.imageThumbSize,
                        height: MedicaSizes.imageThumbSize,
                        image: AssetImage(profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: MedicaSizes.xs,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(speciality,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Rating(
                              rating: rating,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: MedicaColors.textSecondary,
                                  size: 10.0,
                                ),
                                Text(
                                  '${distance}m away',
                                  style: const TextStyle(
                                    color: MedicaColors.textSecondary,
                                    fontSize: 8.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
