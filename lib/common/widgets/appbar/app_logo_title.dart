import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';

class AppLogoAndTitle extends StatelessWidget {
  const AppLogoAndTitle({
    super.key,
    this.showTitle = true,
  });

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          height: 150,
          image: AssetImage(MedicaImages.appLogo),
        ),
        if (showTitle)
          Text(
            MedicaTexts.appName,
            style: Theme.of(context).textTheme.headlineLarge!.apply(color: MedicaColors.primary),
          ),
      ],
    );
  }
}
