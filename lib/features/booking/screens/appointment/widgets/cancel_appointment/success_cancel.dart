import 'package:flutter/material.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';
import '../../../../../../utils/constants/colors.dart';

class SuccessCancelDialog extends StatelessWidget {
  const SuccessCancelDialog({super.key});

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
                'Appointment Successfully Canceled',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.apply(
                      color: const Color(0xffEC5B5B),
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
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK')),
            ],
          )),
    );
  }
}
