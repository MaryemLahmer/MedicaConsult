import 'user.dart';
import 'account.dart';
import 'account_dao.dart';

void main() {
  // Create an instance of User
  User user = User(name: "John Doe", phoneNumber: 55456540);
  // Create an instance of Account
  Account account = Account(
    accountId: 1,
    username: "JohnDoe69",
    email: "example@mail.com",
    password: "test1234",
    user: user,
  );

  // Create an instance of AccountDAO
  AccountDAO accountDAO = AccountDAO();

  // Save the account
  accountDAO.save(account);

  // Delete the account
  accountDAO.delete(account);
}
