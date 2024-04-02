import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class MedicaRadioListTile extends StatefulWidget {
  const MedicaRadioListTile({super.key});

  @override
  State<MedicaRadioListTile> createState() => _MedicaRadioListTileState();
}

final List<String> options = ['Cash', 'Credit Card', 'PayPal'];
final List<String> cardImages = [
  MedicaImages.cash,
  MedicaImages.creditCard,
  MedicaImages.paypal
];

class _MedicaRadioListTileState extends State<MedicaRadioListTile> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.5, color: MedicaColors.accent)),
        child: RadioListTile(
            secondary: Image(
              image: AssetImage(cardImages[0]),
            ),
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.5, color: MedicaColors.accent)),
        child: RadioListTile(
            secondary: Image(
              image: AssetImage(cardImages[1]),
            ),
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.5, color: MedicaColors.accent)),
        child: RadioListTile(
            secondary: Image(
              image: AssetImage(cardImages[2]),
            ),
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
