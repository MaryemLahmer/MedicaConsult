import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/features/booking/screens/payment/widgets/payment_selector.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'add_new_card.dart';

class PaymentMethodPicker extends StatelessWidget {
  
  const PaymentMethodPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              /// App Bar & section Heading
              MedicaAppBar(
                title: Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                showBackArrow: true,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const SectionHeading(
                textHeading: 'Select your payment method',
                showActionButton: false,
              ),

              /// Payment selector
              const SizedBox(height: MedicaSizes.spaceBetweenItems),
              const MedicaRadioListTile(),

              /// add card
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddNewCard()),
                  child: Text(
                    'Add New Card',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),

              /// Next Screen Button
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 7.3,
              ),
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
                    onPressed: () => Get.to(() => const PaymentMethodPicker())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
