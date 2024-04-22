import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/appbar/custom_appbar.dart';
import 'package:medica_consult/common/widgets/custom_shapes/divider.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import '../../../../utils/constants/colors.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

final List<String> options = ['English', 'Francais', 'العربية'];
final List<String> flags = [MedicaImages.english,MedicaImages.french ,MedicaImages.arabic ];

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedicaAppBar(title: Text('Choose Language', style: Theme
          .of(context)
          .textTheme
          .headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MedicaSizes.defaultSpace),
          child: Column(
            children: [

              /// English
              const SizedBox(height: MedicaSizes.spaceBetweenSections,),
              RadioListTile(
                  secondary: Image(image:AssetImage( flags[0]),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: MedicaColors.primary,
                  title: Center(
                      child: Text(
                        options[0],
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                      )),
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  }),
              const MedicaDivider(),

              /// French
              RadioListTile(
                  secondary: Image(image:AssetImage( flags[1]),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: MedicaColors.primary,
                  title: Center(
                      child: Text(
                        options[1],
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                      )),
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  }),

              /// Arabic
              const MedicaDivider(),
              RadioListTile(
                  secondary: Image(image:AssetImage( flags[2]),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: MedicaColors.primary,
                  title: Center(
                      child: Text(
                        options[2],
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
                      )),
                  value: options[2],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
