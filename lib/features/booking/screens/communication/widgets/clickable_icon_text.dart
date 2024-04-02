import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class ClickableIconText extends StatelessWidget {
  const ClickableIconText({
    Key? key,
    required this.icon,
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MedicaSizes.spaceBetweenItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(MedicaSizes.sm),
              decoration: BoxDecoration(
                color: isSelected
                    ? MedicaColors.primary // Change color when selected
                    : backgroundColor ??
                        (MedicaHelperFunctions.isDarkMode(context)
                            ? MedicaColors.black
                            : MedicaColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  // Changed from ClipRRect with const Icon
                  icon,
                  color: isSelected ? MedicaColors.white : MedicaColors.primary,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: isSelected
                            ? MedicaColors
                                .primary // Change text color when selected
                            : MedicaHelperFunctions.isDarkMode(context)
                                ? MedicaColors.white
                                : MedicaColors.black,
                      ),
                  softWrap: false,
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
