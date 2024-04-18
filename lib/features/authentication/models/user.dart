import "account.dart";

class User {
  int _phoneNumber;
  String _name;
  final List<Account> _accounts = [];

  User({
    required int phoneNumber,
    required String name,
  })  : _phoneNumber = phoneNumber,
        _name = name;

  int get getPhoneNumber => _phoneNumber;
  set setPhoneNumber(int value) {
    _phoneNumber = value;
  }

  String get getname => _name;
  set setname(String value) {
    _name = value;
  }

  List<Account> get getAccounts => _accounts;

  void addAccount(Account account) {
    _accounts.add(account);
  }

  void removeAccount(Account account) {
    _accounts.remove(account);
  }
}
