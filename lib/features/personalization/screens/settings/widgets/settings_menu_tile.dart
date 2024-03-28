import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.trailingIcon,
  });

  final IconData icon;
  final IconData trailingIcon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return ListTile(
        leading: Icon(
          icon,
          size: 28,
          color: dark ? MedicaColors.white : MedicaColors.primary,
        ),
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        trailing: IconButton(
          icon: Icon(
            trailingIcon,
            color: dark ? MedicaColors.white : MedicaColors.primary,
            size: 28,
          ),
          onPressed: onPressed,
        ));
  }
}
