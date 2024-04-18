import 'package:medica_consult/features/authentication/models/doctor.dart';
import 'package:medica_consult/features/authentication/models/patient.dart';
import 'package:medica_consult/features/booking/models/medicine.dart';

class Prescription {
  int _prescriptionId;
  String _instructions;
  List<Medicine> _medicines;
  DateTime _date;

  Prescription({
    required int prescriptionId,
    required Doctor doctor,
    required Patient patient,
    required String instructions,
    required List<Medicine> medicines,
    required DateTime date,
  })  : _prescriptionId = prescriptionId,
        _instructions = instructions,
        _medicines = medicines,
        _date = date;

  int get getPrescriptionId => _prescriptionId;
  set setPrescriptionId(int value) {
    _prescriptionId = value;
  }

  String get getInstructions => _instructions;
  set setInstructions(String value) {
    _instructions = value;
  }

  DateTime get getDate => _date;
  set setDate(DateTime value) {
    _date = value;
  }

  List<Medicine> get getMedicines => _medicines;
  set setMedicines(List<Medicine> value) {
    _medicines = value;
  }
}
