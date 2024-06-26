import 'package:flutter/material.dart';
import 'package:medica_consult/features/authentication/screens/signup/signup_first.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/common/styles/spacing_styles.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/app_logo_title.dart';
import '../login/login.dart';
import '../signup/signup.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MedicaSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),

              /// app logo + app name + title + subtitle
              const AppLogoAndTitle(),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 2.5,
              ),
              Text(
                MedicaTexts.optionTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: MedicaSizes.md,
                  right: MedicaSizes.md,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  MedicaTexts.optionSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 2,
              ),

              /// login and create account buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const LoginScreen()),
                    child: const Text(MedicaTexts.signIn),
                  )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Get.off(() => const SignFirst()),
                    child: const Text(MedicaTexts.createAccount),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
