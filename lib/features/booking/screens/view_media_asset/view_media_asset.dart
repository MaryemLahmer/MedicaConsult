import 'package:flutter/material.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:photo_view/photo_view.dart';

class ViewMediaAsset extends StatelessWidget {
  final Image image;

  ViewMediaAsset({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details',
            style: TextStyle(color: MedicaColors.white)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.file_download,
              color: MedicaColors.white,
            ),
            onPressed: () {
              // Implement download action
              // Add your download logic here
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info,
              color: MedicaColors.white,
            ),
            onPressed: () {
              // Implement more info action
              // Add your more info logic here
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('More Info'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Image Path: $image'),
                          // You can add more information here if needed
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: PhotoView(
          imageProvider: image.image, // Load image from the asset path
          backgroundDecoration: const BoxDecoration(
              color: Colors.black), // Set background color to black
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2.0,
        ),
      ),
    );
  }
}
