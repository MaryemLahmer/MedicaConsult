import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/password_config/forget_bottom_sheet.dart';
import 'package:medica_consult/features/authentication/screens/password_config/forget_psw_btn_widget.dart';
import 'package:medica_consult/features/authentication/screens/signup/signup.dart';
import '../../../../../navigation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: MedicaSizes.spaceBetweenSections),
      child: Column(
        children: [
          ///Email
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: MedicaTexts.email),
          ),
          const SizedBox(height: MedicaSizes.spaceBtwInputFields),

          //Password
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MedicaTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: MedicaSizes.spaceBtwInputFields / 2),

          /// Remember Me and Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember Me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(MedicaTexts.rememberMe),
                ],
              ),

              /// Forgot Password
              TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
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
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(MedicaTexts.signIn)),
          ),
          const SizedBox(
            height: MedicaSizes.spaceBetweenItems,
          ),

          /// Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(MedicaTexts.createAccount)),
          ),
        ],
      ),
    ));
  }
}
