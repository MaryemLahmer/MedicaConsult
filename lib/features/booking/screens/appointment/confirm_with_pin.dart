import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/app_logo_title.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../common/widgets/texts/mini_text_field.dart';

class ConfirmWithPin extends StatelessWidget {
  const ConfirmWithPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///App Bar and Logo
              MedicaAppBar(
                title: Text(
                  'Confirm Booking',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const AppLogoAndTitle(
                showTitle: false,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              Center(
                child: Text(
                  'Enter your PIN',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 1.5,
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

              /// Next Page Button
              const SizedBox(height: MedicaSizes.spaceBetweenSections,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () => Get.to(()=> const ConfirmWithPin())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
