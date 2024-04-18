import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/navigation.dart';
import 'package:medica_consult/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';


//--Use this Class to setup themes, initial Bindings, any animations and much more
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const NavigationMenu(),

      ///show loader or circular progress indicator meanwhile authentication repository is deciding to show relevant screen
      ///home:const Scaffold(backgroundColor: MedicaColors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white,),),)
    );
  }
}