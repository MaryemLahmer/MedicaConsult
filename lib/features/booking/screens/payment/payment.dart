import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/features/booking/screens/doctor/widgets/doctor_profile_card.dart';
import 'package:medica_consult/features/booking/screens/payment/widgets/payment_detail.dart';
import 'package:medica_consult/features/booking/screens/payment/widgets/payment_method_picker.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../appointment/appointment_detail_card.dart';
import '../appointment/confirm_with_pin.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
                'Confirm Booking',
                style: Theme.of(context).textTheme.headlineSmall,
              )),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const DoctorProfileCard(
                drImage: MedicaImages.doctorReal,
                drName: 'Dr. Mohsen',
                drLocation: 'Bardo, Hogwarts',
                drSpeciality: 'Cardiologist',
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: MedicaColors.accent, width: 1.5),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(MedicaSizes.md),
                  child: AppointmentDetails(
                      dateHour: '3 pm', package: 'In Cabinet consultation'),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),
        
              /// Pricing details
              const SectionHeading(
                textHeading: 'Payment Detail',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const BillingAmountSection(),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
        
              /// Divider
              const Divider(),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
        
              const SizedBox(
                height: MedicaSizes.md,
              ),
        
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.5, color: MedicaColors.accent)),
                child: RadioListTile(
                  secondary: const Image(
                    image: AssetImage(MedicaImages.creditCard),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: MedicaColors.primary,
                  selected: true,
                  title: Center(
                      child: Text(
                    'Credit Card',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
                  value: 'Credit Card',
                  groupValue: 'Credit Card',
                  onChanged: (String? value) {},
                ),
              ),
        
              /// Next Page Button
              const SizedBox(height: MedicaSizes.spaceBetweenSections,),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Text(
                      'Confirm',
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
