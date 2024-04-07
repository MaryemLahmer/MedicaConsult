import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/personalization/screens/settings/widgets/toggled_setting.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import 'change_PIN.dart';
import 'change_password.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicaAppBar(
        title: Text(
          'Security Settings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              const ToggledSetting(
                setting: 'Remember Me',
              ),
              const ToggledSetting(
                setting: 'Face ID',
              ),
              const ToggledSetting(
                setting: 'Biometric ID',
              ),
              const SizedBox(height: MedicaSizes.spaceBetweenSections,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MedicaColors.primary),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () => Get.to(()=> const ChangePassword())),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
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
                      'Change PIN',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () => Get.to(() => const ChangePIN(oldPinScreen: true,))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
