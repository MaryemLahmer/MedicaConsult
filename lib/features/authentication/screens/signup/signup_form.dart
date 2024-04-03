import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/authentication/screens/signup/terms_conditions.dart';
import 'package:medica_consult/features/authentication/screens/signup/verify_mail.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MedicaTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: MedicaSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MedicaTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          ///Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: MedicaTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          ///Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: MedicaTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          ///PhoneNumber
          TextFormField(
            decoration: const InputDecoration(
                labelText: MedicaTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          ///Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: MedicaTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenSections,
          ),
          ////Terms and conditions
          const MedicaTermCondCheckBox(),
          const SizedBox(height: MedicaSizes.spaceBetweenSections),

          ///Signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.offAll(() => const VerifyMailScreen()),
                child: const Text(MedicaTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
