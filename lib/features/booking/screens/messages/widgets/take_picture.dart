import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/flash_toggle_button.dart';
import 'package:medica_consult/features/booking/screens/messages/widgets/show_picture.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/constants/sizes.dart';

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
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlashToggleWidget(controller: _controller),
          const SizedBox(
            width: MedicaSizes.lg,
          ),
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              shape: BoxShape.circle,
              border: Border.all(
                color: MedicaColors.accent,
                width: 4.0, // Set border width
              ),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
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
              shape: const CircleBorder(),
              elevation: 0.0,
            ),
          ),
          const SizedBox(
            width: MedicaSizes.lg,
          ),
          Container(
            width: 48.0, // Set desired width
            height: 48.0, // Set desired height
            decoration: const BoxDecoration(
              color: Color.fromARGB(225, 255, 255, 255),
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              foregroundColor: MedicaColors.primary,
              onPressed: () async {
                final cameras = await availableCameras();
                // Find the index of the current camera
                final currentCameraIndex =
                    cameras.indexOf(_controller.description);

                // Calculate the index of the next camera to switch to
                final nextCameraIndex =
                    (currentCameraIndex + 1) % cameras.length;

                // Get the next camera
                final nextCamera = cameras[nextCameraIndex];

                // Dispose the current controller
                await _controller.dispose();

                // Initialize the new controller with the next camera
                _controller = CameraController(
                  nextCamera,
                  ResolutionPreset.medium,
                );

                // Update the state
                setState(() {
                  _initializeControllerFuture = _controller.initialize();
                });
              },
              shape: const CircleBorder(),
              elevation: 0.0,
              child: const Icon(Icons.cameraswitch_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
