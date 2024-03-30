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
        height: 150.0,
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
                  width: 1.5,
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
                        width: MedicaSizes.imageThumbSize * 1.4,
                        height: MedicaSizes.imageThumbSize * 1.5,
                        image: AssetImage(profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: MedicaSizes.md,
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  speciality,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Rating(
                                    rating: rating,
                                  ),
                                  const SizedBox(
                                    height: MedicaSizes.md / 1.5,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: MedicaColors.accent,
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
                            ),

                          ],
                        ),
                      ),
                    ),
                     SizedBox(
                      width: 44,
                      child: Center(child: Text('Consult',style: Theme.of(context).textTheme.labelSmall!.apply(color: MedicaColors.accent),),),
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
