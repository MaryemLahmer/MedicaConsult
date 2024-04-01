import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/texts/section_heading.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/date_picker.dart';
import 'package:medica_consult/features/booking/screens/appointment/widgets/hour_picker.dart';
import 'package:medica_consult/utils/constants/sizes.dart';


class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(MedicaSizes.defaultSpace),
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

              /// Choosing date from calendar
              const SectionHeading(
                textHeading: 'Select Available Date:',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.xs,
              ),
              const SizedBox(
                  height: 380, width: double.infinity, child: DatePicker()),

              /// choosing Hour
              const SizedBox(
                height: MedicaSizes.spaceBetweenItems,
              ),
              const SectionHeading(
                textHeading: 'Choose Hour:',
                showActionButton: false,
              ),
              const SizedBox(
                height: MedicaSizes.xs,
              ),
               const Flex(
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HourPicker(),
                      HourPicker(),
                      HourPicker(),
                    ],
                  ),
                  SizedBox(
                    height: MedicaSizes.xs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HourPicker(),
                      HourPicker(),
                      HourPicker(),
                    ],
                  ),
                  SizedBox(
                    height: MedicaSizes.xs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HourPicker(),
                      HourPicker(),
                      HourPicker(),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: MedicaSizes.spaceBetweenSections,
              ),


              /// Next Page Button
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
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class BookAppointment extends StatelessWidget {
//   const BookAppointment({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// App Bar
//               MedicaAppBar(
//                   title: Text(
//                 'Book Appointment',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               )),
//               const SizedBox(
//                 height: MedicaSizes.spaceBetweenSections,
//               ),
//
//               /// Choosing date from calendar
//               const SectionHeading(textHeading: 'Select Available date', showActionButton: false,),
//               const SizedBox(
//                 height: 1900,
//                 width: double.infinity,
//                 child: DatePicker(),
//               ),
//
//               /// choosing Hour
//               /// Next Page Button
//               SizedBox(
//                 width: 250,
//                 child: ElevatedButton(
//                     style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)))),
//                     child: Text(
//                       'Next',
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                     onPressed: () {}),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
