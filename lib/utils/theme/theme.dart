import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class MedicaAppTheme {
  MedicaAppTheme._();

  ///Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MedicaTextTheme.lightTextTheme,
    chipTheme: MedicaChipTheme.lightChipTheme,
    appBarTheme: MedicaAppBarTheme.lightAppBarTheme,
    checkboxTheme: MedicaCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: MedicaBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MedicaElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MedicaOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MedicaTextFieldTheme.lightInputDecorationTheme,
  );

  ///Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MedicaTextTheme.darkTextTheme,
    chipTheme: MedicaChipTheme.darkChipTheme,
    appBarTheme: MedicaAppBarTheme.darkAppBarTheme,
    checkboxTheme: MedicaCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme: MedicaBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MedicaElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MedicaOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MedicaTextFieldTheme.darkInputDecorationTheme,
  );
}
