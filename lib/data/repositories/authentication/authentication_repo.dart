import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medica_consult/features/authentication/screens/login/login.dart';
import 'package:medica_consult/features/authentication/screens/onboarding_screens/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

/* --------- Email & Password sign-in --------- */

  /// [EmailAuthentication] - SignIn
  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      throw 'Something went wrong. Please try again!';
    } on FirebaseException {
      throw 'Something went wrong. Please try again!';
    } on FormatException catch (_) {
      throw 'Something went wrong. Please try again!';
    } on PlatformException {
      throw 'Something went wrong. Please try again!';
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// [EmailAuthentication] - Mail Verification
  /// [EmailAuthentication] - ReAuthenticate User
  /// [EmailAuthentication] - Forget Password
/* --------- Federated identity & social sign-in --------- */
/* --------- ./end Federated identity & social sign in --------- */
}
