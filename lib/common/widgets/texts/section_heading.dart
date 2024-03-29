import 'package:flutter/material.dart';
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key, required this.textHeading, this.buttonTitle='View All', this.textColor, this.showActionButton=true, this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String textHeading;
  final String buttonTitle ;
  final void Function

      ()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textHeading,
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if(showActionButton ) TextButton(
            onPressed: onPressed, child: Text(buttonTitle)),

      ],
    );
  }
}
