import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medica_consult/features/personalization/controllers/user_controller.dart';
import 'package:medica_consult/features/personalization/screens/settings/settings.dart';
import 'package:medica_consult/utils/constants/image_strings.dart';
import 'package:medica_consult/utils/helpers/loaders.dart';
import 'package:medica_consult/utils/helpers/network_manager.dart';
import 'package:medica_consult/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/user/user_repository.dart';

/// Controller to manage user-related functionality
class UpdateUserController extends GetxController {
  static UpdateUserController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appears
  @override
  void onInit() {
    initializeDetails();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeDetails() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  Future<void> updateUserDetails() async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          'Updating Information', MedicaImages.loadingScreen);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Update User's first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
          title: 'All Done', message: 'Your Name has been updated');

      // Move to previous screen
      Get.off(() => const SettingsScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
