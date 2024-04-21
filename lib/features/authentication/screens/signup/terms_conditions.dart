import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import '../../controllers/signup/signup_controller.dart';

class MedicaTermCondCheckBox extends StatelessWidget {
  const MedicaTermCondCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    final controller = SignUpController.instance;

    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(height: MedicaSizes.spaceBetweenItems),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '${MedicaTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${MedicaTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? MedicaColors.white
                          : const Color.fromARGB(255, 0, 7, 5),
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? MedicaColors.white : MedicaColors.primary,
                    )),
            TextSpan(
                text: '${"and "} ',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: '${MedicaTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? MedicaColors.white : MedicaColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? MedicaColors.white : MedicaColors.primary,
                    )),
          ]),
        )
      ],
    );
  }
}
