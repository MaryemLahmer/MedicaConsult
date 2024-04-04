import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails(
      {super.key, required this.dateHour, required this.package});

  final String dateHour;
  final String package;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Expanded(
                child: Text('Date & Hour:', style: Theme
                .of(context)
                .textTheme
                .bodyLarge,)),
            const SizedBox(width: MedicaSizes.spaceBetweenItems,),
            Expanded(child: Text(dateHour, style: Theme
                .of(context)
                .textTheme
                .bodyLarge,)),
          ],),
        const SizedBox(height: MedicaSizes.spaceBetweenItems,),
        Row(children: [
          Expanded(
              child: Text('Package:', style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,)),
          const SizedBox(width: MedicaSizes.spaceBetweenItems,),
          Expanded(child: Text(package, style: Theme
              .of(context)
              .textTheme
              .bodyLarge,))
        ],),
      ],
    );
  }
}
