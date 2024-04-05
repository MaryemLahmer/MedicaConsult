import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/logging/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:record/record.dart';
import 'package:voice_message_package/voice_message_package.dart';

class MyTextField extends StatefulWidget {
  final Function(String) onSendMessage;
  final String? filePath;
  final Directory? directory;

  const MyTextField({
    Key? key,
    required this.onSendMessage,
    this.filePath,
    this.directory,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late String? filePath;
  late Directory? directory;
  final record = Record();
  bool isFocused = false;
  bool isRecording = false;
  bool recordReady = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filePath = widget.filePath;
    directory = widget.directory;
  }

  void startRecord() async {
    directory = await getExternalStorageDirectory();
    filePath =
        directory?.path != null ? '${directory!.path}/myFilffe.m4a' : null;
    await Permission.manageExternalStorage.request();
    await Permission.microphone.request();
    var status = await Permission.manageExternalStorage.status;
    if (status.isGranted) {
      // Check for audio recording permissions
      await Permission.microphone.request();
      bool hasAudioPermission = await record.hasPermission();
      if (hasAudioPermission) {
        try {
          // Start recording
          await record.start(
            path: filePath,
            encoder: AudioEncoder.aacLc, // by default
            bitRate: 128000, // by default
          );
        } catch (e) {
          // Handle recording initialization errors
          MedicaLoggerHelper.error('Error starting recording: $e');
          // You might want to show an error message to the user
        }
      } else {
        // Handle lack of audio recording permissions
        MedicaLoggerHelper.info('Audio recording permission not granted');
        // You might want to prompt the user to grant permissions
      }
    } else {
      // Handle lack of external storage permissions
      MedicaLoggerHelper.info('External storage permission not granted');
      // You might want to prompt the user to grant permissions
    }
  }

  void checkRecordState() async {
    isRecording = await record.isRecording();
  }

  void endRecording() async {
    setState(() {
      isRecording = false;
      recordReady = true;
    });
    await record.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: Column(
        children: [
          recordReady
              ? VoiceMessageView(
                  circlesColor: MedicaColors.primary,
                  activeSliderColor: MedicaColors.primary,
                  controller: VoiceController(
                    audioSrc: '${directory!.path}/myFilffe.m4a',
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
                )
              : const SizedBox(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(36.0),
                      borderSide: const BorderSide(color: MedicaColors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(36.0),
                      borderSide:
                          const BorderSide(color: MedicaColors.borderPrimary),
                    ),
                    hintText: "Type message...",
                    hintStyle: const TextStyle(
                      color: MedicaColors.textSecondary,
                    ),
                    suffixIcon: !isFocused
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.camera_alt_outlined),
                                onPressed: () {
                                  // Handle attachment button press
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.attach_file),
                                onPressed: () {
                                  // Handle send button press
                                  widget.onSendMessage(_textController.text);
                                  _textController.clear();
                                },
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  cursorColor: MedicaColors.black,
                ),
              ),
              const SizedBox(width: 8.0),
              !isFocused && !recordReady
                  ? IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MedicaColors.primary), // Set background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MedicaColors.white),
                      ),
                      onPressed: () {
                        if (isRecording == false) {
                          setState(() {
                            isRecording = true;
                          });

                          startRecord();
                        } else {
                          endRecording();
                        }
                      },
                      icon: !isRecording
                          ? const Icon(
                              Icons.mic,
                              color: MedicaColors.white,
                            )
                          : const Icon(
                              Icons.square,
                              color: MedicaColors.white,
                            ),
                    )
                  : IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MedicaColors.primary), // Set background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            MedicaColors.white),
                      ),
                      onPressed: () {
                        widget.onSendMessage(_textController.text);
                        _textController.clear();
                      },
                      icon: const Icon(
                        Icons.keyboard_double_arrow_right_rounded,
                        color: MedicaColors.white,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
