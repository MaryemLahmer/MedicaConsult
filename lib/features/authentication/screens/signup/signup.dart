import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/common/login_signup/form_divider.dart';
import 'package:medica_consult/common/login_signup/social_buttons.dart';
import 'package:medica_consult/features/authentication/screens/signup/signup_form.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MedicaAppBar(
                showBackArrow: true,
              ),

              ///Title
              Text(MedicaTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: MedicaSizes.spaceBetweenSections),

              ////Form
              const SignUpForm(),
              const SizedBox(height: MedicaSizes.spaceBetweenSections),

              ///divider
              FormDivider(dividerText: MedicaTexts.orSignInWith.capitalize!),
              const SizedBox(height: MedicaSizes.spaceBetweenSections),

              ///SocialButtons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
