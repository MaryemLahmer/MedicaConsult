import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/authentication/screens/password_config/forget_pass_otp.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// App Bar
            MedicaAppBar(
              title: Text(
                'Reset Password',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              showBackArrow: true,
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenSections * 2,
            ),
            Padding(
              padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
              child: Column(
                children: [
                  ///Image
                  Image(
                    image: const AssetImage(
                        MedicaImages.deliveredEmailIllustration),
                    width: MedicaHelperFunctions.screenWidth() * 0.6,
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),

                  //Heading
                  Text(MedicaTexts.forgotPassword,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: MedicaSizes.spaceBetweenItems),
                  Text(MedicaTexts.forgotPasswordSubtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: MedicaSizes.spaceBetweenSections * 2),

                  //Text field
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: MedicaTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),

                  //Submit Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => const OTPScreen()),
                        child: const Text(MedicaTexts.submit)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
