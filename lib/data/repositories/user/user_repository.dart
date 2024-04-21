import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/personalization/models/user_model.dart';

/// repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw 'error message';
    } on FormatException catch (_) {
      throw 'error message';
    } on PlatformException catch (e) {
      throw 'error message';
    } catch (e) {
      throw 'Something went wrong, please try again!';
    }
  }

  /// Function to fetch user details based on user ID
  /// Function to update User data in Firestore
  ///
}
