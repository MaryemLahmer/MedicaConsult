import 'user.dart';
import 'account.dart';

class AccountDAO {
  // This is just a stub implementation, actual implementation would interact with a database or other data source

  void save(Account account) {
    // Save the account data to the database
    print("Saving account with ID: ${account.getAccountId}");
  }

  void update(Account account) {
    // Update the account data in the database
    print("Updating account with ID: ${account.getAccountId}");
  }

  void delete(Account account) {
    // Delete the account data from the database
    print("Deleting account with ID: ${account.getAccountId}");
  }

  Account findById(int accountId) {
    // Retrieve account data from the database based on accountId
    // This is just a stub, would typically perform database query

    User user = User(name: "John Doe", phoneNumber: 55456540);

    return Account(
        accountId: accountId,
        username: "John Doe",
        email: "example@mail.com",
        password: "test1234",
        user: user); // Dummy data
  }
}
