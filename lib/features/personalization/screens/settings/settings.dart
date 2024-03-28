import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/custom_shapes/containers/header_container.dart';
import 'package:medica_consult/common/widgets/divider.dart';
import 'package:medica_consult/common/widgets/images/circular_image.dart';
import 'package:medica_consult/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

import '../profile/user_profile_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  MedicaAppBar(
                    title: Text(
                      'Account Settings',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: MedicaColors.white),
                    ),
                  ),

                  /// User Vertical Card Profile
                  const UserProfileCard()
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(MedicaSizes.defaultSpace / 2),
              child: Column(
                children: [
                  SettingsMenuTile(
                    icon: Iconsax.user,
                    title: 'Edit Profile Details',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.document,
                    title: 'Reports & Prescriptions',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.card,
                    title: 'Payment',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.lock_1,
                    title: 'Security',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.language_square,
                    title: 'Language',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.eye,
                    title: 'Dark Mode',
                    onPressed: () {},
                    trailingIcon: Icons.toggle_on_rounded,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.setting_2,
                    title: 'General Settings',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Help Center',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),
                  ListTile(
                    leading: const Icon(
                      Iconsax.logout,
                      size: 28,
                      color: MedicaColors.error,
                    ),
                    title: Text('Log Out',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: MedicaColors.error)),
                  ),
                  ListTile(
                    leading: const Icon(
                      Iconsax.profile_delete,
                      size: 28,
                      color: MedicaColors.error,
                    ),
                    title: Text('Delete Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: MedicaColors.error)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
