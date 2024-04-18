import "package:medica_consult/features/booking/models/medicine.dart";

import "member.dart";

class PharmaceuticalCompany extends Member {
  List<Medicine> _medicineList;

  PharmaceuticalCompany({
    required super.name,
    required super.phoneNumber,
    required super.address,
    required super.dateOfBirth,
    List<Medicine> medicineList = const [],
  }) : _medicineList = medicineList;

  List<Medicine> get getMedicineList => _medicineList;

  set medicineList(List<Medicine> value) {
    _medicineList = value;
  }
}
