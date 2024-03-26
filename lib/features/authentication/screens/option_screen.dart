import 'package:flutter/material.dart';
import 'package:medica_consult/common/styles/spacing_styles.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/text_strings.dart';

import '../../../utils/constants/image_strings.dart';

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
              /// app logo + app name + title + subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: MedicaSizes.spaceBetweenSections ,),
                  const Image(
                      height: 150, 
                      image: AssetImage(MedicaImages.appLogo),
                  ),
                  Text(MedicaTexts.appName, style: Theme.of(context).textTheme.headlineLarge, ),
                  const SizedBox(height: MedicaSizes.spaceBetweenSections *2.5,),
                  Text(MedicaTexts.optionTitle, style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: MedicaSizes.spaceBetweenItems ,),
                  Center(child: Padding(
                    padding: const EdgeInsets.only(left: MedicaSizes.md,right: MedicaSizes.md,),
                    child: Text(MedicaTexts.optionSubtitle, style: Theme.of(context).textTheme.bodyLarge,),
                  )),
                ],
              ),
              const SizedBox(height: MedicaSizes.spaceBetweenSections *2,),
              /// login and create account buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: const Text(MedicaTexts.signIn),
                )
              ),
              const SizedBox(height: MedicaSizes.spaceBetweenItems,),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: (){}, child: const Text(MedicaTexts.createAccount),
                  )
              )],
          ),
        ),
      ),
    );
  }
}
