import 'package:flutter/material.dart';
import 'package:medica_consult/features/personalization/screens/settings/reports_and_prescriptions.dart';
import 'package:medica_consult/features/personalization/screens/settings/security/security_screen.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/custom_shapes/containers/header_container.dart';
import 'package:medica_consult/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import '../../../../data/repositories/authentication/authentication_repo.dart';
import '../profile/widgets/user_profile_card.dart';
import 'change_language.dart';
import 'edit_profile.dart';
import 'package:get/get.dart';
import 'general_settings.dart';
import 'help_center/help_center.dart';

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
                          .headlineSmall!
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
                  /// Profile details
                  SettingsMenuTile(
                    icon: Iconsax.user,
                    title: 'Edit Profile Details',
                    onPressed: () => Get.to(() => const EditProfileDetails()),
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// Documents
                  SettingsMenuTile(
                    icon: Iconsax.document,
                    title: 'Reports & Prescriptions',
                    onPressed: () =>
                        Get.to(() => const ReportsAndPrescriptions()),
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// Payment
                  SettingsMenuTile(
                    icon: Iconsax.card,
                    title: 'Payment',
                    onPressed: () {},
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// security Settings
                  SettingsMenuTile(
                    icon: Iconsax.lock_1,
                    title: 'Security',
                    onPressed: () => Get.to(() => const SecurityScreen()),
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// Language settings
                  SettingsMenuTile(
                    icon: Iconsax.language_square,
                    title: 'Language',
                    onPressed: () => Get.to(() => const ChangeLanguageScreen()),
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// Dark mode setting
                  SettingsMenuTile(
                    toggle: true,
                    icon: Iconsax.eye,
                    title: 'Dark Mode',
                    onPressed: () {},
                  ),

                  /// General settings
                  SettingsMenuTile(
                    icon: Iconsax.setting_2,
                    title: 'General Settings',
                    onPressed: () => Get.to(() => const GeneralSettings()),
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// help Center
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Help Center',
                    onPressed: () => Get.to(() => const HelpCenter()),
                    trailingIcon: Iconsax.arrow_right_3,
                  ),

                  /// Log out option

                  ListTile(
                    leading: IconButton(
                      onPressed: () => AuthenticationRepository.instance.logout(),
                      icon: const Icon(
                        Iconsax.logout,
                        size: 28,
                        color: MedicaColors.error,
                      ),
                    ),
                    title: Text('Log Out',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: MedicaColors.error)),
                  ),

                  /// Delete Account option
                  ListTile(
                      leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.profile_delete,
                      size: 28,
                      color: MedicaColors.error,
                    ),
                  ),
                    title: Text('Delete Account',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: MedicaColors.error)),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
