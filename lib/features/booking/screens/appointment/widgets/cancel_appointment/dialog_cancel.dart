import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/cancel_appointment/reason_cancel.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';

import '../../../../../../utils/constants/colors.dart';

class CancelDialog extends StatelessWidget {
  const CancelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 16,
        ),
        decoration: BoxDecoration(
            color: dark ? const Color.fromARGB(255, 0, 0, 0) : MedicaColors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Cancel Appointment'.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: const Color(0xffEC5B5B),
                  ),
            ),
            const SizedBox(height: MedicaSizes.spaceBetweenSections * 1.5),
            Text(
              'Are you sure You Want to cancel Your Appointment ? \n \n Please keep in mind that only 50 % of the fees will be refunded. ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 32),
                        foregroundColor: const Color(0xffEC5B5B),
                        side: const BorderSide(
                          color: Color(0xffEC5B5B),
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go Back')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 32),
                      foregroundColor: const Color(0xff2A303E),
                      backgroundColor: MedicaColors.primary,
                    ),
                    onPressed: () => Get.to(() => const Cancel()),
                    child: const Text('Yes, cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
