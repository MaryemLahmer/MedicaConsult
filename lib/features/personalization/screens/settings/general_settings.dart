import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../common/widgets/buttons/switch_toggle.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicaAppBar(title: Text('General Settings',style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [
              MedicaSwitch(title: 'General Notifications',onPressed: (){}),
              MedicaSwitch(title: 'Sound',onPressed: (){}),
              MedicaSwitch(title: 'vibrate',onPressed: (){}),
              MedicaSwitch(title: 'Special Offers',onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
