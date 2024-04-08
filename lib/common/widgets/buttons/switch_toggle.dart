import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';

class MedicaSwitch extends StatefulWidget {
  const MedicaSwitch({
    super.key,
    required this.title,
    required this.onPressed,
    this.trailingIcon,
    this.icon,
  });

  final IconData? icon;
  final IconData? trailingIcon;
  final String title;
  final VoidCallback onPressed;

  @override
  State<MedicaSwitch> createState() => _SettingsMenuTileState();
}

class _SettingsMenuTileState extends State<MedicaSwitch> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return ListTile(
        minLeadingWidth: 5,
        leading: Icon(
          widget.icon,
          size: 5,
          color: dark ? MedicaColors.white : MedicaColors.primary,
        ),
        title: Text(widget.title,
            style: Theme.of(context).textTheme.headlineSmall),
        trailing: IconButton(
          icon: Switch(
              value: isToggled,
              activeColor: MedicaColors.primary,
              onChanged: (value) {
                setState(() {
                  isToggled = value;
                });
              }),
          onPressed: widget.onPressed,
        ));
  }
}
