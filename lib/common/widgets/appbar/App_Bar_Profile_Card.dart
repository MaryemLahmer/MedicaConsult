import 'package:flutter/material.dart';
import 'package:medica_consult/features/personalization/controllers/user_controller.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../loaders/shimmer_effect.dart';

class UserImageAndNameWIthIcon extends StatelessWidget {
  const UserImageAndNameWIthIcon(
      {super.key,
      required this.height,
      required this.width,
      required this.radius,
      required this.imageName,
      required this.title,
      this.icon,
      this.iconSize,
      this.onPressed,
      this.rating});

  final double height;
  final double width;
  final double radius;
  final String imageName;
  final String title;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback? onPressed;
  final Widget? rating;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: MedicaColors.white),
                  ),
                  const SizedBox(
                    height: MedicaSizes.xs,
                  ),
                  Obx(() {
                    if (controller.profileLoading.value) {
                      // Display a shimmer loader while user profile is being loaded
                      return const ShimmerEffect(width: 80, height: 15);
                    } else {
                      return Text(controller.user.value.fullName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(
                                  color: dark
                                      ? MedicaColors.white
                                      : MedicaColors.black));
                    }
                  }),
                  Padding(
                    padding: const EdgeInsets.all(MedicaSizes.xs / 3),
                    child: rating,
                  )
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
