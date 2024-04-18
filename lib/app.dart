import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/onboarding.dart';
import 'features/booking/screens/payment/widgets/payment_method_picker.dart';
import 'navigation.dart';
import 'utils/theme/theme.dart';

//--Use this Class to setup themes, initial Bindings, any animations and much more
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MedicaAppTheme.lightTheme,
      darkTheme: MedicaAppTheme.darkTheme,
      home: const OnBoardingScreen(),

      ///show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen
      ///home:const Scaffold(backgroundColor: MedicaColors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white,),),)
    );
  }
}
