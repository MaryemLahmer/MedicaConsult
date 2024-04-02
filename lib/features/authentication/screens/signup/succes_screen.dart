import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/common/styles/spacing_styles.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: MedicaSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Image(
                image:
                    const AssetImage(MedicaImages.deliveredEmailIllustration),
                width: MedicaHelperFunctions.screenWidth() * 0.6,
              ),

              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),

              ///Title&Subtitle

              Text(MedicaTexts.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              Text(MedicaTexts.yourEmailCreatedSubtitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text(MedicaTexts.tContinue))),
            ],
          )),
    ));
  }
}
