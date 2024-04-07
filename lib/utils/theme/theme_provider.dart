import 'package:flutter/material.dart';
import 'theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = MedicaAppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == MedicaAppTheme.lightTheme){
      themeData = MedicaAppTheme.darkTheme;
    }else{
      themeData = MedicaAppTheme.lightTheme;
    }
  }

}