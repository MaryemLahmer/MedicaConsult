import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:medica_consult/features/authentication/screens/signup/succes_screen.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class VerifyMailScreen extends StatelessWidget {
  const VerifyMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
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

              Text(MedicaTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              Text('saafi.saf0@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              Text(MedicaTexts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const SuccessScreen()),
                      child: const Text(MedicaTexts.tContinue))),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(MedicaTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
