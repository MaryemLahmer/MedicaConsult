import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/repositories/authentication/authentication_repo.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/helpers/loaders.dart';
import 'package:medica_consult/utils/helpers/network_manager.dart';
import 'package:medica_consult/utils/popups/full_screen_loader.dart';

import '../../screens/password_config/reset_passwort.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request', MedicaImages.loadingScreen);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Screen
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request', MedicaImages.loadingScreen);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // remove Loader
      FullScreenLoader.stopLoading();

      // Show Success Screen
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password'.tr);

    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
