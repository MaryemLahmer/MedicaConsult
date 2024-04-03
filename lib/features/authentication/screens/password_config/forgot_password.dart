import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/password_config/reset_password.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(MedicaTexts.forgotPassword,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: MedicaSizes.spaceBetweenItems),
            Text(MedicaTexts.forgotPasswordSubtitle,
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
                  onPressed: () => Get.off(() => const ResetPassword()),
                  child: const Text(MedicaTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
