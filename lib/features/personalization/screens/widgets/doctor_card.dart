import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/formatters/formatter.dart';

class DoctorCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String speciality;
  final double rating;
  final double distance;
  final VoidCallback onPressed;
  const DoctorCard({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.distance,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 132.0,
        child: Padding(
          padding: const EdgeInsets.only(
              left: MedicaSizes.sm, right: MedicaSizes.sm),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: MedicaColors.softGrey,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(MedicaSizes.sm),
                child: Column(
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
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          speciality,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: MedicaColors.textSecondary,
                          ),
                        ),
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
                                  '$distance away',
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

class Rating extends StatelessWidget {
  final double rating;
  const Rating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.0),
        child: Container(
          color: const Color(0xFFE8F3F1),
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
