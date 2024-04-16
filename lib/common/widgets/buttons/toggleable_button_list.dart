import 'package:flutter/material.dart';
import 'package:medica_consult/common/widgets/buttons/color_changing_button.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class ToggleableButtonList extends StatefulWidget {
  const ToggleableButtonList(
      {super.key,
      this.options = const ['General', 'Account', 'Service', 'Payment']});

  final List<String> options;

  @override
  State<ToggleableButtonList> createState() => _ToggleableButtonListState();
}

class _ToggleableButtonListState extends State<ToggleableButtonList> {
  List<String> pressedList = [];

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.options.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            return Row(
              children: [
                ColorChangingElevatedButton(
                  activeColor: MedicaColors.primary,
                  inactiveColor: MedicaColors.grey,
                  text: widget.options[i],
                  selectedList: pressedList,
                )
              ],
            );
          }),
    );
  }
}
