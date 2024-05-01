import 'package:flutter/material.dart';
import 'package:medica_consult/features/authentication/controllers/login/login_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MedicaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: MedicaSizes.iconMd,
                  height: MedicaSizes.iconMd,
                  image: AssetImage(MedicaImages.google))),
        ),
        const SizedBox(width: MedicaSizes.spaceBetweenItems,),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MedicaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: MedicaSizes.iconMd,
                  height: MedicaSizes.iconMd,
                  image: AssetImage(MedicaImages.facebook))),
        ),
        const SizedBox(width: MedicaSizes.spaceBetweenItems,),
      ],
    );
  }
}
