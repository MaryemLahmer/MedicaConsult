import "member.dart";

class Doctor extends Member {
  String _profileImage;
  String _speciality;
  double _rating;

  Doctor({
    required super.name,
    required super.phoneNumber,
    required super.address,
    required super.dateOfBirth,
    required String profileImage,
    required String speciality,
    required double rating,
  })  : _profileImage = profileImage,
        _speciality = speciality,
        _rating = rating;

  String get getSpeciality => _speciality;
  set setSpeciality(String value) {
    _speciality = value;
  }

  String get getProfileImage => _profileImage;
  set setProfileImage(String value) {
    _profileImage = value;
  }

  double get getRating => _rating;
  set setRating(double value) {
    _rating = value;
  }
}
