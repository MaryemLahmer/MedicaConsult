import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_function.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
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

                Text(MedicaTexts.changePasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: MedicaSizes.spaceBetweenItems),
                Text(MedicaTexts.changePasswordSubtitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: MedicaSizes.spaceBetweenSections),

                ///Buttons
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.off(() => const LoginScreen()),
                        child: const Text(MedicaTexts.done))),
                const SizedBox(height: MedicaSizes.spaceBetweenItems),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(MedicaTexts.resendEmail))),
              ],
            ),
          ),
        ));
  }
}
