import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';

class DisplayPictureScreen extends StatefulWidget {
  final Function(String?, String) onSendMessage;
  final String imagePath;

  const DisplayPictureScreen({
    super.key,
    required this.onSendMessage,
    required this.imagePath,
  });

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  List<Map<String, dynamic>> messageArray = [];

  void addMessage(String? content, String type) {
    final currentTime = DateTime.now();
    final message = {
      'sender': 'bob', // Assuming the sender is the user for now
      'content': content,
      'time': currentTime,
      'type': type
    };
    setState(() {
      messageArray.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.file(File(widget.imagePath)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 60,
                height: 60,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 24,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MedicaColors.primary), // Example color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        MedicaColors.white), // Example color
                  ),
                  onPressed: () {
                    widget.onSendMessage(widget.imagePath, "image");
                    print('Sending picture: ${widget.imagePath}');
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.double_arrow_rounded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
