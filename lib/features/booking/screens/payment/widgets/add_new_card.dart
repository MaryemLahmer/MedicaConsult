import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:medica_consult/common/widgets/appbar/app_logo_title.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/features/booking/screens/payment/widgets/payment_method_picker.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final TextEditingController cardController = TextEditingController();
    DateTime dateTime = DateTime.now();

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

              /// Card Details
              const SectionHeading(
                textHeading: 'Card Name',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              TextFormField(
                controller: cardController,
                decoration: const InputDecoration(
                  labelText: 'Card Name',
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const SectionHeading(
                textHeading: 'Card Number',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              const Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SectionHeading(
                      textHeading: 'Expiry Date',
                      showActionButton: false,
                    ),
                  ),
                  SizedBox(
                    width: MedicaSizes.spaceBetweenItems * 1.5,
                  ),
                  Expanded(
                    child: SectionHeading(
                      textHeading: 'CVV',
                      showActionButton: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      readOnly: true,
                      controller: textController,
                     // expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Date',
                          suffixIcon: Icon(Iconsax.calendar)),
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2050));
                        if (pickedDate != null) {
                          setState(() {
                            dateTime = pickedDate;
                            textController.text =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: MedicaSizes.spaceBetweenItems,
                  ),
                  Expanded(
                    child: TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                      ),
                    ),
                  ),

                ],
              ),

              /// Next Screen Button
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 3,
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
                    onPressed: () => Get.to(() =>  PaymentMethodPicker(cardName: cardController.text,))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
