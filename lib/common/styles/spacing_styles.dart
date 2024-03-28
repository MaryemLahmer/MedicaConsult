import 'package:flutter/cupertino.dart';
import '../../utils/constants/sizes.dart';

class MedicaSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: MedicaSizes.appBarHeight,
    bottom: MedicaSizes.defaultSpace ,
    left: MedicaSizes.defaultSpace,
    right: MedicaSizes.defaultSpace,
  );
}