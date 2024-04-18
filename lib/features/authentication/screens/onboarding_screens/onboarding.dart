import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/widgets/onboarding_dot_navigation.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/widgets/onboarding_next_button.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/widgets/onboarding_page.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/widgets/onboarding_skip.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: MedicaImages.onboardingScreen1,
                  title: MedicaTexts.onBoardingTitle1,
                  subtitle: MedicaTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: MedicaImages.onboardingScreen2,
                  title: MedicaTexts.onBoardingTitle2,
                  subtitle: MedicaTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: MedicaImages.onboardingScreen3,
                  title: MedicaTexts.onBoardingTitle3,
                  subtitle: MedicaTexts.onBoardingSubTitle3),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation Smooth Page Indicator
          const OnBoardingDotNavigation(),

          const OnBoardingNextBottom()
        ],
      ),
    );
  }
}
