import 'package:flutter/material.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/option_screen.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class MedicaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MedicaAppBar(
      {super.key,
      this.title,
      this.showBackArrow = true,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MedicaSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                icon: Icon(
                  Iconsax.arrow_left,
                  color: dark ? MedicaColors.white : MedicaColors.black,
                ),
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: () => Get.back(), icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MedicaDeviceUtils.getAppBarHeight());
}
