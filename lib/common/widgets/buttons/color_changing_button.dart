import 'package:flutter/material.dart';

class ColorChangingElevatedButton extends StatefulWidget {
  const ColorChangingElevatedButton(
      {super.key, required this.activeColor, required this.inactiveColor, required this.text});

  final Color activeColor;
  final Color inactiveColor;
  final String text;

  @override
  State<ColorChangingElevatedButton> createState() =>
      _ColorChangingElevatedButtonState();
}

class _ColorChangingElevatedButtonState
    extends State<ColorChangingElevatedButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: OutlinedButton(
            onPressed: () => setState(() {
                  pressed = !pressed;
                }),
            style: ButtonStyle(
                backgroundColor: (pressed == true)
                    ? MaterialStateProperty.all(widget.activeColor)
                    : MaterialStateProperty.all(widget.inactiveColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            child: Text(widget.text)));
  }
}
