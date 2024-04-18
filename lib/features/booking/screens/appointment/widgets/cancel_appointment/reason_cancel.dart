import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/cancel_appointment/reasons_cancel_list.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/cancel_appointment/success_cancel.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import '../../../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';

class Cancel extends StatelessWidget {
  const Cancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(children: [
            /// App Bar & section Heading
            MedicaAppBar(
              title: Text(
                'Cancel Appointment',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              showBackArrow: true,
            ),
            const SizedBox(
              height: MedicaSizes.spaceBetweenItems,
            ),
            const SectionHeading(
              textHeading: 'Please tell us your reasons:',
              textColor: MedicaColors.primary,
              showActionButton: false,
            ),
            const SizedBox(height: MedicaSizes.spaceBetweenItems),
            const ReasonsCancel(),
            const SizedBox(
              height: MedicaSizes.spaceBetweenSections * 5,
            ),
            Text(
                'According to our privacy policy, we wont inform the doctor about the reasons behind your decision. ',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center),
            const SizedBox(height: MedicaSizes.spaceBetweenSections * 2),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                child: Text(
                  'Confirm',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => const SuccessCancelDialog()));
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
