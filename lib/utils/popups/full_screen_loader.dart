import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica_consult/utils/constants/colors.dart';
import 'package:medica_consult/utils/helpers/helper_function.dart';

import '../../common/widgets/loaders/animation_loader.dart';

/// A utility class for managing a full-screen loading dialog
class FullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///  - text: The text to be displayed in the loading dialog
  ///  - animation: The lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        // Overlay dialogs
        barrierDismissible: false,
        // The dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color: MedicaHelperFunctions.isDarkMode(Get.context!)
                  ? MedicaColors.dark
                  : MedicaColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  AnimationLoaderWidget(text: text, animation: animation)
                ],
              ),
            )));
  }

  /// Stop The currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close dialog using the navigator
  }
}
