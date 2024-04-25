import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/repositories/authentication/authentication_repo.dart';
import 'package:medica_consult/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:medica_consult/features/authentication/screens/signup/succes_screen.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class VerifyMailScreen extends StatelessWidget {
  const VerifyMailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
              Text(email ?? '',
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
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(MedicaTexts.tContinue))),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(MedicaTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
