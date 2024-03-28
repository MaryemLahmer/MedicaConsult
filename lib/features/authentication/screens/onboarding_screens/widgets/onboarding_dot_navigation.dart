import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: MedicaDeviceUtils.getBottomNavigationBarHeight() + 30,
      left: MedicaSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? MedicaColors.light : MedicaColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
