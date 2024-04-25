import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/repositories/authentication/authentication_repo.dart';
import 'package:medica_consult/features/authentication/screens/signup/succes_screen.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever Verify Screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() =>
            SuccessScreen(
              title: MedicaTexts.yourAccountCreatedTitle,
              subtitle: MedicaTexts.yourEmailCreatedSubtitle,
              image: MedicaImages.successfullyRegister,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),

            ));
      }
    });
  }

  /// Manually check if Email Verified
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
              () =>
              SuccessScreen(image: MedicaImages.successfullyRegister,
                  title: MedicaTexts.yourAccountCreatedTitle,
                  subtitle: MedicaTexts.yourEmailCreatedSubtitle,
                  onPressed: () =>
                      AuthenticationRepository.instance.screenRedirect())
      );
    }
  }
}
