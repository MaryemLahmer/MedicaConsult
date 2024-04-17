import "user.dart";
import "address.dart";

class Member extends User {
  Address _address;
  DateTime _dateOfBirth;

  Member({
    required super.phoneNumber,
    required super.name,
    required Address address,
    required DateTime dateOfBirth,
  })  : _address = address,
        _dateOfBirth = dateOfBirth;

  Address get getAddress => _address;
  set setAddress(Address value) {
    _address = value;
  }

  DateTime get getDateOfBirth => _dateOfBirth;
  set setDateOfBirth(DateTime value) {
    _dateOfBirth = value;
  }
}
