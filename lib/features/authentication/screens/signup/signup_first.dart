import 'package:flutter/material.dart';
import 'package:medica_consult/features/authentication/screens/signup/signup.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/common/styles/spacing_styles.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/app_logo_title.dart';

class SignFirst extends StatelessWidget {
  const SignFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MedicaSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const SizedBox(
                height: 90.0,
              ),

              /// app logo + app name + title + subtitle
              const AppLogoAndTitle(),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections ,
              ),
              Text(
                MedicaTexts.optionTitle1,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
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
                  MedicaTexts.optionSubtitle1,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 1.5,
              ),

              /// login and create account buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const SignupScreen()),
                    child: const Text('Patient Account'),
                  )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const SignupScreen()),
                    child: const Text('Doctor Account'),
                  )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const SignupScreen()),
                    child: const Text('Pharmacy Account'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
