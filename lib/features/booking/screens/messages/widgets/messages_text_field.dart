import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/take_picture.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/voice_message.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/logging/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:record/record.dart';

class MyTextField extends StatefulWidget {
  final Function(String?, String) onSendMessage;
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
  String tempFileName = "";
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filePath = widget.filePath;
    directory = widget.directory;
  }

  String generateTempFileName() {
    // Get current timestamp
    DateTime now = DateTime.now();

    // Generate a random string of length 6
    String randomString = '';
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    for (int i = 0; i < 6; i++) {
      randomString += chars[random.nextInt(chars.length)];
    }

    // Combine timestamp and random string to create unique file name
    String tempFileName =
        '${now.year}_${now.month}_${now.day}_${now.hour}_${now.minute}_${now.second}_$randomString.m4a';

    return tempFileName;
  }

  void startRecord() async {
    tempFileName = generateTempFileName();
    directory = await getExternalStorageDirectory();
    filePath =
        directory?.path != null ? '${directory!.path}/$tempFileName' : null;
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
              ? VoiceMessage(directory: directory, fileName: tempFileName)
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
                                onPressed: () async {
                                  // Ensure that plugin services are initialized so that `availableCameras()`
                                  // can be called before navigating to `TakePictureScreen`
                                  WidgetsFlutterBinding.ensureInitialized();

                                  // Obtain a list of the available cameras on the device.
                                  final cameras = await availableCameras();

                                  // Get a specific camera from the list of available cameras.
                                  final firstCamera = cameras.first;

                                  // Navigate to TakePictureScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TakePictureScreen(
                                        camera: firstCamera,
                                        onSendMessage: widget.onSendMessage,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.attach_file),
                                onPressed: () {
                                  // Handle send button press
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
                        recordReady
                            ? widget.onSendMessage(filePath, "audio")
                            : widget.onSendMessage(
                                _textController.text, "text");
                        setState(() {
                          recordReady = false;
                        });
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
