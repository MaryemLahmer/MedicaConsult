import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/voice_message.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

class SentMessageBox extends StatelessWidget {
  final String content;
  final DateTime time;
  final String type;
  final Directory? directory;
  const SentMessageBox({
    super.key,
    required this.content,
    required this.time,
    required this.type,
    required this.directory,
  });

  String getFileNameFromPath(String filePath) {
    // Find the index of the last occurrence of '/' (or '\\' for Windows paths)
    final int lastIndex = filePath.lastIndexOf('/');
    if (lastIndex != -1) {
      // Extract the substring after the last '/'
      return filePath.substring(lastIndex + 1);
    }
    // If '/' is not found, return the original filePath
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(MedicaSizes.xs),
        child: Container(
          decoration: const BoxDecoration(
            color: MedicaColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(MedicaSizes.sm),
              bottomRight: Radius.circular(MedicaSizes.sm),
              topLeft: Radius.circular(MedicaSizes.sm),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MedicaSizes.sm),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = MediaQuery.of(context).size.width * 0.6;
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: type == "audio" ? double.infinity : maxWidth),
                    child: type == "audio"
                        ? VoiceMessage(
                            directory: directory,
                            fileName: content.replaceFirst(directory!.path, ''),
                          )
                        : type == "image"
                            ? Image.file(File(content))
                            : type == "pdf"
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        MedicaImages
                                            .applePay, // Assuming you have a PDF icon image
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: 140,
                                        child: Text(
                                          getFileNameFromPath(content),
                                          style: const TextStyle(
                                              fontSize: 8,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    content,
                                    style: const TextStyle(
                                        color: MedicaColors.white),
                                  ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
