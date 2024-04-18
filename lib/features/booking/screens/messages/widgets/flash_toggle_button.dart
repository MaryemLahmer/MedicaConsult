import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class FlashToggleWidget extends StatefulWidget {
  final CameraController controller;

  const FlashToggleWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _FlashToggleWidgetState createState() => _FlashToggleWidgetState();
}

class _FlashToggleWidgetState extends State<FlashToggleWidget> {
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(225, 255, 255, 255),
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        foregroundColor: MedicaColors.primary,
        onPressed: _toggleFlash,
        shape: const CircleBorder(),
        elevation: 0.0,
        child: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
      ),
    );
  }

  void _toggleFlash() {
    if (widget.controller.value.flashMode == FlashMode.off) {
      widget.controller.setFlashMode(FlashMode.torch);
      setState(() {
        isFlashOn = true;
      });
    } else {
      widget.controller.setFlashMode(FlashMode.off);
      setState(() {
        isFlashOn = false;
      });
    }
  }
}
