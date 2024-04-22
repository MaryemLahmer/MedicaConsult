import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class DoctorProfileCard extends StatelessWidget {
  const DoctorProfileCard(
      {super.key,
      required this.drName,
      required this.drSpeciality,
      required this.drLocation,
      required this.drImage,
        this.height = 120,
       this.width = 120,  this.radius = 20});

  final String drName;
  final String drSpeciality;
  final String drLocation;
  final String drImage;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          height: height,
          width: width,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                image: AssetImage(drImage),
              )),
        ),
        const SizedBox(
          width: MedicaSizes.spaceBetweenItems,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                drName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenItems * 1.5,
            ),
            Text(
              drSpeciality,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: MedicaColors.darkerGrey),
            ),
            const SizedBox(
              height: MedicaSizes.md / 2,
            ),
            Row(
              children: [
                const Icon(
                  Iconsax.location,
                  color: MedicaColors.darkerGrey,
                  size: 15,
                ),
                const SizedBox(
                  width: MedicaSizes.md / 2,
                ),
                Text(
                  drLocation,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: MedicaColors.darkerGrey),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
