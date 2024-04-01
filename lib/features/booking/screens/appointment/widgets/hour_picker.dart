import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class HourPicker extends StatefulWidget {
  const HourPicker({super.key});

  @override
  State<HourPicker> createState() => _HourPickerState();
}

class _HourPickerState extends State<HourPicker> {
  @override
  Widget build(BuildContext context) {
    String date;
    return Column(
      children: [
        SizedBox(
            width: 100,
            height: 50,
            child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return MedicaColors.primary;
                      }
                      return null;
                    },
                  ),
                ),
                onPressed: () => {},
                child: Center(
                    child: Text(
                  "9.30AM",
                  style: Theme.of(context).textTheme.bodySmall,
                )))),

      ],
    );
  }
}
