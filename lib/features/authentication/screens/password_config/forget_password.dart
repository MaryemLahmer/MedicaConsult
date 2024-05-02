import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:medica_consult/features/authentication/screens/password_config/reset_passwort.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: MedicaAppBar(),
      body: Padding(
        padding: EdgeInsets.all(MedicaSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              MedicaTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenItems,
            ),
            Text(
              MedicaTexts.forgotPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenSections * 2,
            ),

            /// Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: MedicaValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: MedicaTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenSections,
            ),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    controller.sendPasswordResetEmail(),
                child: const Text(MedicaTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
