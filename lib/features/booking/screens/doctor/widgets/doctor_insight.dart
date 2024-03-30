import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class DoctorInsight extends StatelessWidget {
  const DoctorInsight(
      {super.key,
      required this.title,
      this.backgroundColor,
      required this.subtitle,
      required this.iconData});

  final String title, subtitle;
  final Color? backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: Icon(
              iconData,
              size: 35,
              color: MedicaHelperFunctions.isDarkMode(context)
                  ? MedicaColors.white
                  : MedicaColors.primary,
            ),
            // child: Image(
            //   image: AssetImage(image),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),

        /// Text
        const SizedBox(
          height: MedicaSizes.spaceBetweenItems / 2,
        ),
        Column(
          children: [
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: MedicaHelperFunctions.isDarkMode(context)
                          ? MedicaColors.white
                          : MedicaColors.primary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: MedicaHelperFunctions.isDarkMode(context)
                          ? MedicaColors.darkGrey
                          : MedicaColors.darkerGrey.withOpacity(0.5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
