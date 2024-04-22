import "user.dart";

class Account {
  int _accountId;
  String _username;
  String _email;
  String _password;
  final User _user;

  Account({
    required int accountId,
    required String username,
    required String email,
    required String password,
    required User user,
  })  : _accountId = accountId,
        _username = username,
        _email = email,
        _password = password,
        _user = user;

  int get getAccountId => _accountId;
  set setAccountId(int value) {
    _accountId = value;
  }

  String get getUsername => _username;
  set setUsername(String value) {
    _username = value;
  }

  String get getEmail => _email;
  set setEmail(String value) {
    _email = value;
  }

  String get getPassword => _password;
  set setPassword(String value) {
    _password = value;
  }

  User get getUser => _user;
}
