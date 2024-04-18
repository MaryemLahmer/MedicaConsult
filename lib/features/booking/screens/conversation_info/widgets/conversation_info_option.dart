import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class ConversationInfoOption extends StatelessWidget {
  const ConversationInfoOption({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: MedicaColors.softGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: MedicaColors.primary,
          ),
        ),
      ),
    );
  }
}
