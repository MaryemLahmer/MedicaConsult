import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class MedicaSwitchListTile extends StatefulWidget {
  const MedicaSwitchListTile(
      {super.key,
      required this.icon,
      required this.consultation,
      required this.price});

  final IconData icon;
  final String consultation;
  final String price;

  @override
  State<MedicaSwitchListTile> createState() => _MedicaSwitchListTileState();
}

class _MedicaSwitchListTileState extends State<MedicaSwitchListTile> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    IconData icon = widget.icon;
    String price = widget.price;
    String consultation = widget.consultation;

    return SwitchListTile(
        title: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Text(
                consultation,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: MedicaColors.black),
              )),
              Text(
                price,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        activeColor: MedicaColors.primary,
        activeTrackColor: MedicaColors.accent,
        secondary: Icon(
          icon,
          color: MedicaColors.primary,
        ),
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        });
  }
}
