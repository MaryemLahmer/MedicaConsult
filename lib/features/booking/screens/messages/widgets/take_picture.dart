import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:medica_consult/data/data.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final Function(String?, String) onSendMessage;
  const TakePictureScreen({
    super.key,
    required this.onSendMessage,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: MedicaSizes.md),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: MedicaColors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          'Take a picture',
          style: TextStyle(color: MedicaColors.white),
        ),
      ),
      backgroundColor: Colors.black, // Set background color to blue
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            if (!context.mounted) return;
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                  onSendMessage: widget.onSendMessage,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        shape: CircleBorder(), // Set shape to CircleBorder
        elevation: 0.0, // Remove shadow by setting elevation to 0.0
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
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
                  icon: Icon(Icons.double_arrow_rounded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
