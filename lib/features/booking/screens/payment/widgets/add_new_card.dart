import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/app_logo_title.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/features/booking/screens/payment/widgets/payment_method_picker.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              MedicaAppBar(
                title: Text(
                  'Add a Card',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                showBackArrow: true,
              ),
              const SizedBox(
                height: MedicaSizes.md,
              ),
              const AppLogoAndTitle(),
              const SizedBox(
                height: MedicaSizes.md,
              ),
              const Image(
                  height: 150,
                  width: 150,
                  image: AssetImage(MedicaImages.add_card)),

              /// Next Screen Button
              const SizedBox(height: MedicaSizes.spaceBetweenSections*7.3,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () => Get.to(()=> const PaymentMethodPicker())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
