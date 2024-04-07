import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ConversationAction extends StatelessWidget {
  const ConversationAction({
    super.key,
    required this.icon,
    this.onPressed,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
            color: color,
          ),
          const SizedBox(
            width: MedicaSizes.spaceBetweenItems,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
