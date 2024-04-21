import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/repositories/authentication/authentication_repo.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/helpers/loaders.dart';
import 'package:medica_consult/utils/popups/full_screen_loader.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// --- SIGN UP
  void signup() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          'Hold While We Process Your Information',
          MedicaImages.onLoadingAnimation);

      // // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   return;
      // }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                " In order to create account, you must read and accept the Privacy Policy & Terms of Use of MedicaConsult");
      }
      // Register user in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim,
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');



      // Show Success Message

      // Move to Verify Email Screen
    } catch (e) {
      // Show some generic error to the user
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      FullScreenLoader.stopLoading();
    }
  }
}