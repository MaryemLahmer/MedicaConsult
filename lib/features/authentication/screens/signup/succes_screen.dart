import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medica_consult/common/styles/spacing_styles.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: MedicaSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),

              /// Title&Subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              Text(subtitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MedicaSizes.spaceBetweenSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(MedicaTexts.tContinue))),
            ],
          )),
    ));
  }
}
