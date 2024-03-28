import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.contain,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 100,
    this.width = 100,
    this.padding = MedicaSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double height, width, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // if image background color is null then switch it to light and dark mode color design
        color: MedicaHelperFunctions.isDarkMode(context)
            ? MedicaColors.dark
            : MedicaColors.white,
        borderRadius: BorderRadius.circular(150),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
