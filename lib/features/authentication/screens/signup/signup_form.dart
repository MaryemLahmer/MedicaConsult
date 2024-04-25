import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/features/authentication/controllers/signup/signup_controller.dart';
import 'package:medica_consult/features/authentication/screens/signup/terms_conditions.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/validators/validation.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      MedicaValidator.validateEmptyText('First name', value),
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
                  controller: controller.lastName,
                  validator: (value) =>
                      MedicaValidator.validateEmptyText('Last name', value),
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

          /// Username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
               MedicaValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: MedicaTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => MedicaValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: MedicaTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          /// PhoneNumber
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => MedicaValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: MedicaTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBtwInputFields,
          ),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => MedicaValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: MedicaTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenSections,
          ),

          /// Terms and conditions
          const MedicaTermCondCheckBox(),
          const SizedBox(height: MedicaSizes.spaceBetweenSections),

          /// Signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(MedicaTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
