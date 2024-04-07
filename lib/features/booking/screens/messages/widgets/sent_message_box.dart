import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/voice_message.dart';
import 'package:medica_consult/features/booking/screens/view_media_asset/view_media_asset.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/constants/sizes.dart';
import 'package:medica_consult/utils/formatters/formatter.dart';

class SentMessageBox extends StatefulWidget {
  final String content;
  final DateTime time;
  final String type;
  final Directory? directory;
  const SentMessageBox({
    Key? key,
    required this.content,
    required this.time,
    required this.type,
    required this.directory,
  }) : super(key: key);

  @override
  _SentMessageBoxState createState() => _SentMessageBoxState();
}

class _SentMessageBoxState extends State<SentMessageBox> {
  bool showText = false;

  void toggleTextVisibility() {
    setState(() {
      showText = !showText;
    });
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: toggleTextVisibility,
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
                              maxWidth: widget.type == "audio"
                                  ? double.infinity
                                  : maxWidth),
                          child: widget.type == "audio"
                              ? VoiceMessage(
                                  directory: widget.directory,
                                  fileName: widget.content
                                      .replaceFirst(widget.directory!.path, ''),
                                )
                              : widget.type == "image"
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.to(() => ViewMediaAsset(
                                            image: Image.file(
                                                File(widget.content))));
                                      },
                                      child: Image.file(File(widget.content)))
                                  : widget.type == "pdf"
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.picture_as_pdf,
                                              size: 32,
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                getFileNameFromPath(
                                                    widget.content),
                                                style: const TextStyle(
                                                    fontSize: 8,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          widget.content,
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
            if (showText)
              Text(
                MedicaFormatter.formatTime(widget
                    .time), // Replace "Your text here" with the desired text
                style: Theme.of(context).textTheme.labelMedium,
              ),
          ],
        ),
      ),
    );
  }
}
