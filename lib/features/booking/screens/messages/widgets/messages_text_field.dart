import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/take_picture.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/voice_message.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/logging/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';

import 'package:record/record.dart';

class MyTextField extends StatefulWidget {
  final Function(String?, String) onSendMessage;
  final String? voiceMessageFilePath;
  final Directory? directory;

  const MyTextField({
    Key? key,
    required this.onSendMessage,
    this.voiceMessageFilePath,
    this.directory,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late String? voiceMessageFilePath;
  late Directory? directory;
  final record = Record();
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedFile;
  bool fileReady = false;
  File? fileToDisplay;
  bool isFocused = false;
  bool isRecording = false;
  bool recordReady = false;
  String tempFileName = "";
  bool showWarningMessage = true;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    voiceMessageFilePath = widget.voiceMessageFilePath;
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
    voiceMessageFilePath =
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
            path: voiceMessageFilePath,
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

  void pickFile() async {
    try {
      setState(() {
        fileReady = false;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());

        print('File name $_fileName');
      }
      if (pickedFile!.extension == 'pdf' ||
          pickedFile!.extension == 'jpg' ||
          pickedFile!.extension == 'png') {
        setState(() {
          fileReady = true;
        });
      } else {
        setState(() {
          fileReady = false;
        });
      }
    } catch (e) {
      print(e);
    }
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
          fileReady && pickedFile != null
              ? SizedBox(
                  child: pickedFile!.extension == 'pdf'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              MedicaImages
                                  .applePay, // Assuming you have a PDF icon image
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _fileName!,
                              style: const TextStyle(fontSize: 8),
                            ),
                          ],
                        )
                      : pickedFile!.extension == 'png' ||
                              pickedFile!.extension == 'jpg'
                          ? Image.file(
                              fileToDisplay!,
                              height: 94,
                              width: 94,
                              fit: BoxFit.cover,
                            )
                          : Builder(
                              builder: (context) {
                                // Initialize a timer to hide unsupported file type text after 5 seconds
                                Timer(const Duration(seconds: 3), () {
                                  setState(() {
                                    showWarningMessage = false;
                                  });
                                });
                                return showWarningMessage
                                    ? const Text("Unsupported file type")
                                    : const SizedBox();
                              },
                            ),
                )
              : const SizedBox(),
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
                                  pickFile();
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
              !isFocused && !recordReady && !fileReady
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
                            ? widget.onSendMessage(
                                voiceMessageFilePath, "audio")
                            : (fileReady && pickedFile != null)
                                ? (pickedFile!.extension == 'pdf'
                                    ? widget.onSendMessage(
                                        pickedFile!.path.toString(), "pdf")
                                    : widget.onSendMessage(
                                        pickedFile!.path.toString(), "image"))
                                : (_textController.text.isNotEmpty
                                    ? widget.onSendMessage(
                                        _textController.text, "text")
                                    : null);

                        setState(() {
                          recordReady = false;
                          fileReady = false;
                          showWarningMessage = false;
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
