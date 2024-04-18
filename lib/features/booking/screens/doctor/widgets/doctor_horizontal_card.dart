import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/features/booking/screens/communication/widgets/rating.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class DoctorHorziontalCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String speciality;
  final double rating;
  final double distance;
  final VoidCallback onPressed;
  const DoctorHorziontalCard({
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
        width: double.infinity,
        height: 110.0,
        child: Padding(
          padding: const EdgeInsets.only(
              top: MedicaSizes.xs, bottom: MedicaSizes.xs),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: MedicaSizes.imageThumbSize,
                        height: MedicaSizes.imageThumbSize,
                        image: AssetImage(profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: MedicaSizes.xs,
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
