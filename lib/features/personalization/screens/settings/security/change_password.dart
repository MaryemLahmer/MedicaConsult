import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassword = TextEditingController();
    return Scaffold(
      appBar: MedicaAppBar(
        title: Text(
          'Change Password',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              /// Old Password
              const SectionHeading(
                textHeading: 'Enter Old Password',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.xs,
              ),
              TextFormField(
                controller: oldPassword,
                obscureText: obscure,
                decoration: InputDecoration(
                  labelText: MedicaTexts.oldPassword,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: (obscure = true)
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye),
                  ),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// New Password
              const SectionHeading(
                textHeading: 'Enter New Password',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.xs,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: MedicaTexts.newPassword,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.eye_slash),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),

              /// Confirm New Password
              const SectionHeading(
                textHeading: 'Confirm New Password:',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.xs,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: MedicaTexts.newPassword,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.eye_slash),
                    onPressed: () {},
                  ),
                ),
              ),

              const SizedBox(
                height: MedicaSizes.spaceBetweenSections * 2.5,
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
                      'Done',
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
