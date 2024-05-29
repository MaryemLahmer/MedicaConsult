import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/Home/home.dart';
import 'package:medica_consult/features/booking/screens/appointment/schedual.dart';
import 'package:medica_consult/navigation.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';
import '../../../../../../utils/constants/colors.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return Dialog(
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: BoxDecoration(
              color: dark ? const Color.fromARGB(255, 0, 0, 0) : MedicaColors.white,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Image.asset('assets/icons/success.png', width: 72),
              const SizedBox(height: 24),
              Text(
                'Payment Success!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                  color: MedicaColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    foregroundColor: const Color(0xff2A303E),
                    backgroundColor: MedicaColors.primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);

                  },
                  child: const Text('OK')),
            ],
          )),
    );
  }
}
