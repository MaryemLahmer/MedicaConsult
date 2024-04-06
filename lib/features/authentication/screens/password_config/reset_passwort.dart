import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

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
            height: MedicaSizes.spaceBetweenSections,
          ),
          Padding(
            padding: EdgeInsets.all(MedicaSizes.defaultSpace),
            child: Column(
              children: [
                const SizedBox(
                  height: MedicaSizes.spaceBetweenSections * 2,
                ),
                //Password
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: MedicaTexts.password,
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenItems,
                ),
                //Confirm Password
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: 'Confirm Password',
                      suffixIcon: Icon(Iconsax.eye_slash)),
                ),
                const SizedBox(
                  height: MedicaSizes.spaceBetweenSections,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text(MedicaTexts.signIn)),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
