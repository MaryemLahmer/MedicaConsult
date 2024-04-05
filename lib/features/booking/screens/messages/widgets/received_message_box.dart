import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class ReceivedMessageBox extends StatelessWidget {
  final String content;
  final DateTime time;
  const ReceivedMessageBox({
    super.key,
    required this.content,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(MedicaSizes.xs),
        child: Container(
          decoration: const BoxDecoration(
            color: MedicaColors.softGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(MedicaSizes.sm),
              bottomRight: Radius.circular(MedicaSizes.sm),
              topRight: Radius.circular(MedicaSizes.sm),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.sm),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = MediaQuery.of(context).size.width * 0.6;
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      content,
                      style: const TextStyle(color: MedicaColors.black),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
