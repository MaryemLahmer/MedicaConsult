import 'dart:math' show pi, sin, cos;
import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class DotsCirclingProgressIndicator extends StatefulWidget {
  final double radius;
  final int dotCount;
  final Color dotColor;
  final Duration duration;

  const DotsCirclingProgressIndicator({super.key, 
    this.radius = 28.0,
    this.dotCount = 10,
    this.dotColor = MedicaColors.primary,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  _DotsCirclingProgressIndicatorState createState() =>
      _DotsCirclingProgressIndicatorState();
}

class _DotsCirclingProgressIndicatorState
    extends State<DotsCirclingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Widget> _dots;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();

    _dots = List.generate(widget.dotCount, (index) {
      final angle = (index * 2 * pi) / widget.dotCount;
      return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final offset = Offset(
            widget.radius * cos(angle + _controller.value * 2 * pi),
            widget.radius * sin(angle + _controller.value * 2 * pi),
          );
          return Transform.translate(
            offset: offset,
            child: child,
          );
        },
        child: Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.dotColor,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: _dots,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
