class Address {
  int _zipcode;
  String _state;
  String _city;
  String _street;

  Address({
    required int zipcode,
    required String state,
    required String city,
    required String street,
  })  : _zipcode = zipcode,
        _state = state,
        _city = city,
        _street = street;

  int get getZipcode => _zipcode;
  set setZipcode(int value) {
    _zipcode = value;
  }

  String get getState => _state;
  set setState(String value) {
    _state = value;
  }

  String get getCity => _city;
  set setCity(String value) {
    _city = value;
  }

  String get getStreet => _street;
  set setStreet(String value) {
    _street = value;
  }
}
