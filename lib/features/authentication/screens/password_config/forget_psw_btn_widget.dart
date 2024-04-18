import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

class ForgetBtnWidget extends StatelessWidget {
  const ForgetBtnWidget({
    required this.btnIcon,
    required this.subTitle,
    required this.title,
    required this.onTap(),
    super.key,
  });

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MedicaHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: dark ? Color.fromARGB(255, 26, 24, 24) : MedicaColors.white,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            const SizedBox(width: 10.0),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
            ])
          ],
        ),
      ),
    );
  }
}
