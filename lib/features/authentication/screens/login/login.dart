import 'package:flutter/material.dart';
import 'package:medica_consult/common/styles/spacing_styles.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: MedicaSpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  children: [
                    /// Logo and the the title and then the subtext
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Image(
                          height: 150,
                          image: AssetImage(MedicaImages.appLogo),
                        ),
                        Text(
                          MedicaTexts.loginTitle,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),

                    /// Form
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: MedicaSizes.spaceBetweenSections),
                        child: Column(
                          children: [
                            /// Mail
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.direct_right),
                                labelText: MedicaTexts.email,
                              ),
                            ),
                            const SizedBox(
                              height: MedicaSizes.spaceBtwInputFields,
                            ),

                            /// Password
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.password_check),
                                labelText: MedicaTexts.password,
                                suffixIcon: Icon(
                                  Iconsax.eye_slash,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: MedicaSizes.spaceBtwInputFields / 2,
                            ),

                            /// Remember me & forgot pass
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                const Text(MedicaTexts.rememberMe),
                              ],
                            ),

                            /// Forgot
                            TextButton(
                              onPressed: () {},
                              child: const Text(MedicaTexts.forgotPassword),
                            ),

                            const SizedBox(
                              height: MedicaSizes.spaceBtwInputFields,
                            ),

                            /// Sign In
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(MedicaTexts.signIn),
                              ),
                            ),

                            const SizedBox(
                              height: MedicaSizes.spaceBetweenItems,
                            ),

                            //// Create account
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(MedicaTexts.createAccount),
                              ),
                            ),

                            const SizedBox(
                              height: MedicaSizes.spaceBtwInputFields,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Divider
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Divider(
                            color: MedicaColors.grey,
                            thickness: 0.5,
                            indent: 60,
                            endIndent: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
