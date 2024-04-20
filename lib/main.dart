import 'package:flutter/material.dart';
import 'package:medica_consult/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {

  // Initialize firebase
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
    ).then(
       (FirebaseApp value) => Get.put(AuthenticationRepository())
   );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),

  ));
}
