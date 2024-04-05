import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class EditProfileDetails extends StatelessWidget {
  const EditProfileDetails({super.key});

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
                  'Edit Profile Details',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// Text fields
              /// * editing name
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: MedicaSizes.spaceBetweenSections),
                  prefixIcon: const Icon(Iconsax.user),
                  hintText: 'Edit Name',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: MedicaColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: MedicaColors.primary, width: 2)),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// * editing phone number
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: MedicaSizes.spaceBetweenSections),
                  prefixIcon: const Icon(Iconsax.call),
                  hintText: 'Edit Phone Number',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: MedicaColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: MedicaColors.primary, width: 2)),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// * editing date of birth
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: MedicaSizes.spaceBetweenSections),
                  prefixIcon: const Icon(Iconsax.calendar),
                  hintText: 'Edit Date of Birth',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: MedicaColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: MedicaColors.primary, width: 2)),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// * editing address
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      left: MedicaSizes.spaceBetweenSections),
                  prefixIcon: const Icon(Iconsax.location),
                  hintText: 'Edit Address',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: MedicaColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: MedicaColors.primary, width: 2)),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 1.5,
              ),

              /// confirm and cancel buttons
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Text(
                      'Confirm',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () {}),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MedicaColors.darkGrey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
