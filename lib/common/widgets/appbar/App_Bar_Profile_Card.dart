import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class UserImageAndNameWIthIcon extends StatelessWidget {
  const UserImageAndNameWIthIcon({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    required this.imageName,
    required this.title,
    required this.subtitle,
    this.icon,
    this.iconSize,
    this.onPressed,
    this.rating
  });

  final double height;
  final double width;
  final double radius;
  final String imageName;
  final String title;
  final String subtitle;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback? onPressed;
  final Widget? rating;

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Image(
              width: width,
              height: height,
              image: AssetImage(imageName),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(MedicaSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: MedicaSizes.xs,
                  ),
                  Text(subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: dark? MedicaColors.white:MedicaColors.darkerGrey)),
                  Padding(padding: const EdgeInsets.all(MedicaSizes.xs/3),child: rating,)
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              icon,
              size: iconSize,
            ), // Bell icon
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
