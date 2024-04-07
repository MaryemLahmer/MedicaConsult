import 'package:flutter/material.dart';
import 'package:medica_consult/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),

  ));
}
