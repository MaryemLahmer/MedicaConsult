import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(MedicaSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: MedicaColors.white)),
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
