import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ReasonsCancel extends StatefulWidget {
  const ReasonsCancel({super.key});

  @override
  State<ReasonsCancel> createState() => _MedicaRadioListTileState();
}

final List<String> options = [
  'I want to change to another doctor',
  'I have recovered from the disease',
  'I want to change and try another package'
];
final List<String> cardImages = [
  MedicaImages.cash,
  MedicaImages.creditCard,
  MedicaImages.paypal
];

class _MedicaRadioListTileState extends State<ReasonsCancel> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: MedicaColors.primary,
            title: Center(
                child: Text(
              options[0],
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            value: options[0],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            }),
      ),
      const SizedBox(
        height: MedicaSizes.spaceBetweenItems,
      ),
      Container(
        child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: MedicaColors.primary,
            title: Center(
                child: Text(
              options[1],
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            value: options[1],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            }),
      ),
      const SizedBox(
        height: MedicaSizes.spaceBetweenItems,
      ),
      Container(
        child: RadioListTile(
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: MedicaColors.primary,
            title: Center(
                child: Text(
              options[2],
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            value: options[2],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            }),
      ),
      const SizedBox(
        height: MedicaSizes.spaceBetweenItems,
      ),
    ]);
  }
}
