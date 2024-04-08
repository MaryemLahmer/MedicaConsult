import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/theme/theme_provider.dart';

class SettingsMenuTile extends StatefulWidget {
  const SettingsMenuTile({
    super.key,
    this.icon,
    required this.title,
    required this.onPressed,
    this.trailingIcon,
    this.toggle = false,
  });

  final IconData? icon;
  final IconData? trailingIcon;
  final String title;
  final VoidCallback onPressed;
  final bool toggle;

  @override
  State<SettingsMenuTile> createState() => _SettingsMenuTileState();
}

class _SettingsMenuTileState extends State<SettingsMenuTile> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return ListTile(
        leading: Icon(
          widget.icon,
          size: 28,
          color: dark ? MedicaColors.white : MedicaColors.primary,
        ),
        title: Text(widget.title,
            style: Theme.of(context).textTheme.headlineSmall),
        trailing: IconButton(
          icon: (widget.toggle != true)
              ? Icon(
                  widget.trailingIcon,
                  color: dark ? MedicaColors.white : MedicaColors.primary,
                  size: 28,
                )
              : Switch(
                  value: isToggled,
                  activeColor: MedicaColors.primary,
                  onChanged: (value) {
                    setState(() {
                      isToggled = value;
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    });
                  }),
          onPressed: widget.onPressed,
        ));
  }
}
