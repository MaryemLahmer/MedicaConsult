import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:medica_consult/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/screens/settings/edit_profile.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_config/forget_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: MedicaSizes.spaceBetweenSections),
      child: Column(
        children: [
          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => MedicaValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: MedicaTexts.email),
          ),
          const SizedBox(height: MedicaSizes.spaceBtwInputFields),

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
          const SizedBox(height: MedicaSizes.spaceBtwInputFields / 2),

          /// Remember Me and Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Obx(
                     () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value),
                  ),
                  const Text(MedicaTexts.rememberMe),
                ],
              ),

              /// Forgot Password
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(MedicaTexts.forgotPassword)),
            ],
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenSections,
          ),

          /// Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: ()  => controller.emailAndPasswordSignIn(),
                child: const Text(MedicaTexts.signIn)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenItems,
          ),

          /// Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const EditProfileDetails()),
                child: const Text(MedicaTexts.createAccount)),
          ),
        ],
      ),
    ));
  }
}
