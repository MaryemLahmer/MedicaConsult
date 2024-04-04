import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/features/booking/screens/payment/widgets/payment_method_picker.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/package_selector.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import 'package:get/get.dart';

class PackagePicker extends StatelessWidget {
  const PackagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              /// App Bar
              MedicaAppBar(
                  title: Text(
                'Book Appointment',
                style: Theme.of(context).textTheme.headlineSmall,
              )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              const SectionHeading(
                textHeading: 'Choose Package:',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.xs,
              ),

              /// Text
              Text(
                'Please select the package that suits your problem best. Keep in mind that some changes can be made to your appointment details if the doctor chooses so. In such cases, you will be immediately notified and if necessary messaged by the doctors themselves.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// choosing package
              Container(
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: MedicaColors.accent, width: 1.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: const MedicaSwitchListTile(
                    icon: Iconsax.hospital,
                    consultation: 'In Cabinet Consultation',
                    price: '60 DT',
                  )),
              const SizedBox(height: MedicaSizes.spaceBetweenItems,),
              Container(
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: MedicaColors.accent, width: 1.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: const MedicaSwitchListTile(
                    icon: Iconsax.video,
                    consultation: 'Via Video Call',
                    price: '40 DT',
                  )),
              const SizedBox(height: MedicaSizes.spaceBetweenItems,),
              Container(
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: MedicaColors.accent, width: 1.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: const MedicaSwitchListTile(
                    icon: Iconsax.call,
                    consultation: 'Via Voice Call',
                    price: '30 DT',
                  )),
              const SizedBox(height: MedicaSizes.spaceBetweenItems,),
              Container(
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: MedicaColors.accent, width: 1.5),
                      borderRadius: BorderRadius.circular(30)),
                  child: const MedicaSwitchListTile(
                    icon: Iconsax.message,
                    consultation: 'Via Messaging',
                    price: '20 DT',
                  )),

              /// Next Page Button
              const SizedBox(height: MedicaSizes.spaceBetweenSections*2.9,),
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
                    onPressed: () => Get.to(()=> const PaymentMethodPicker(cardName: '',))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
