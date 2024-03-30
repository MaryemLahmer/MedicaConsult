import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:readmore/readmore.dart';

class TextDescription extends StatelessWidget {
  const TextDescription({super.key, required this.textDescription});

  final String textDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ReadMoreText(
        textDescription,
        trimExpandedText: ' Show Less',
        trimCollapsedText: '  Show More',
        trimMode: TrimMode.Line,
        trimLines: 2,
        moreStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: MedicaColors.primary),
        lessStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: MedicaColors.primary),
      ),
    );
  }
}
