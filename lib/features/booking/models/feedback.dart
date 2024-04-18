import 'package:medica_consult/features/authentication/models/doctor.dart';
import 'package:medica_consult/features/authentication/models/patient.dart';

class Prescription {
  int _prescriptionId;
  int _rating;
  String _content;
  DateTime _date;

  Prescription({
    required int prescriptionId,
    required int rating,
    required Doctor doctor,
    required Patient patient,
    required String content,
    required DateTime date,
  })  : _prescriptionId = prescriptionId,
        _rating = rating,
        _content = content,
        _date = date;

  int get getPrescriptionId => _prescriptionId;
  set setPrescriptionId(int value) {
    _prescriptionId = value;
  }

  int get getRating => _rating;
  set setRating(int value) {
    _rating = value;
  }

  String get getContent => _content;
  set setContent(String value) {
    _content = value;
  }

  DateTime get getDate => _date;
  set setDate(DateTime value) {
    _date = value;
  }
}
