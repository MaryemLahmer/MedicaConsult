import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medica_consult/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication/authentication_repo.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {

  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
