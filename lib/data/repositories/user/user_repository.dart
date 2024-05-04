import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica_consult/data/repositories/authentication/authentication_repo.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

/// repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw MedicaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MedicaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MedicaFormatException();
    } on PlatformException catch (e) {
      throw MedicaPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw MedicaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MedicaFormatException();
    } on PlatformException catch (e) {
      throw MedicaPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to update User data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw MedicaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MedicaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MedicaFormatException();
    } on PlatformException catch (e) {
      throw MedicaPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Update any field in specific users Collections
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw MedicaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MedicaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MedicaFormatException();
    } on PlatformException catch (e) {
      throw MedicaPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw MedicaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MedicaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MedicaFormatException();
    } on PlatformException catch (e) {
      throw MedicaPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
