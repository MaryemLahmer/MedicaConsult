import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class ToggledSetting extends StatefulWidget {
  const ToggledSetting(
      {super.key, required this.setting,});

  final String setting;

  @override
  State<ToggledSetting> createState() => _ToggledSettingState();
}

class _ToggledSettingState extends State<ToggledSetting> {
  bool activated = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(widget.setting,
                style: Theme.of(context).textTheme.headlineSmall)),
        Switch(
            activeColor: MedicaColors.primary,
            value: activated,
            onChanged: (value) {
              setState(() {
                activated = value;
              });
            }),
      ],
    );
  }
}
