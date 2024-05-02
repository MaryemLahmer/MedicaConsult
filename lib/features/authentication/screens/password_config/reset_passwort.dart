import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

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
                /// Image
                Image(
                  image:
                      const AssetImage(MedicaImages.deliveredEmailIllustration),
                  width: MedicaHelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenSections,
                ),

                /// Email, title and subtitle
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                Text(
                  MedicaTexts.changePasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                Text(
                  MedicaTexts.changePasswordSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenSections,
                ),

                /// Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(MedicaTexts.done),
                  ),
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => ForgetPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text(MedicaTexts.resendEmail),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
