import 'package:flutter/material.dart';
import 'package:medica_consult/common/login_signup/form_divider.dart';
import 'package:medica_consult/common/login_signup/social_buttons.dart';
import 'package:medica_consult/common/widgets/appbar/app_logo_title.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/authentication/screens/login/widgets/loginForm.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// App Bar
            MedicaAppBar(
              title: Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              showBackArrow: true,
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenSections,
            ),
            const Padding(
              padding: EdgeInsets.all(MedicaSizes.defaultSpace),
              child: Column(
                children: [
                  /// app logo and title
                  AppLogoAndTitle(),

                  /// Login Form
                  LoginForm(),

                  /// Divider
                  FormDivider(dividerText: MedicaTexts.orSignInWith),
                  SizedBox(
                    height: MedicaSizes.spaceBetweenItems,
                  ),

                  /// Social Buttons
                  SocialButtons(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
