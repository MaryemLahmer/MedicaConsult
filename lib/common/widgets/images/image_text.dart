import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MedicaSizes.spaceBetweenItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Circular Icon
            Container(
              height: 50,
              width: 60,
              padding: const EdgeInsets.all(MedicaSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (MedicaHelperFunctions.isDarkMode(context)
                        ? MedicaColors.black
                        : MedicaColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Text
            const SizedBox(
              height: MedicaSizes.spaceBetweenItems / 2,
            ),
            SizedBox(
              width: 80,
              height: 40,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: MedicaHelperFunctions.isDarkMode(context)
                          ? MedicaColors.white
                          : MedicaColors.black),
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
