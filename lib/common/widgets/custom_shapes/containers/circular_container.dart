import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class MedicaCircularContainer extends StatelessWidget {
  const MedicaCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.child,
      this.backgroundColor = MedicaColors.white});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}
