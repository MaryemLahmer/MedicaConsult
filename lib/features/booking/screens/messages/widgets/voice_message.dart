import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:voice_message_package/voice_message_package.dart';

class VoiceMessage extends StatelessWidget {
  const VoiceMessage({
    super.key,
    required this.directory,
    required this.fileName,
  });

  final Directory? directory;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return VoiceMessageView(
      circlesColor: MedicaColors.primary,
      activeSliderColor: MedicaColors.primary,
      controller: VoiceController(
        audioSrc: '${directory!.path}/$fileName',
        maxDuration: const Duration(seconds: 100),
        isFile: false,
        onComplete: () {
          /// do something on complete
        },
        onPause: () {
          /// do something on pause
        },
        onPlaying: () {
          /// do something on playing
        },
      ),
      innerPadding: 12,
      cornerRadius: 20,
    );
  }
}
