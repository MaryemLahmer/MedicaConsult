import "member.dart";

class Patient extends Member {
  String _profileImage;

  Patient({
    required super.name,
    required super.phoneNumber,
    required super.address,
    required super.dateOfBirth,
    required String profileImage,
  }) : _profileImage = profileImage;

  String get getProfileImage => _profileImage;
  set setProfileImage(String value) {
    _profileImage = value;
  }
}
