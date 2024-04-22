import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/app_logo_title.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/personalization/screens/settings/settings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../../common/widgets/texts/mini_text_field.dart';
import '../../../../../utils/constants/colors.dart';

class ChangePIN extends StatelessWidget {
  const ChangePIN({super.key, required this.oldPinScreen});

  final bool oldPinScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicaAppBar(
        title: Text(
          'Change PIN',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
        child: Column(
          children: [
            const AppLogoAndTitle(
              showTitle: false,
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenSections,
            ),
            Center(
              child: Text(
                (oldPinScreen == true)
                    ? 'Enter your Current PIN'
                    : 'Enter your New PIN',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(
              height: MedicaSizes.lg * 3,
            ),

            /// Number Fields
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MiniTextFiled(),
                MiniTextFiled(),
                MiniTextFiled(),
                MiniTextFiled(),
              ],
            ),
            const SizedBox(
              height: MedicaSizes.lg * 3,
            ),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MedicaColors.primary),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  child: Text(
                    (oldPinScreen == true) ? 'Next' : 'Confirm',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onPressed: () {
                    if (oldPinScreen == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePIN(oldPinScreen: false)));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
