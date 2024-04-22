/// Custom exception class to handle various format-related errors
class MedicaFormatException implements Exception {
  /// The associated error message
  final String message;

  /// Default constructor with a generic error message
  const MedicaFormatException(
      [this.message = 'An unexpected format error occurred. Please try again']);

  /// Create a format exception from a specific error message
  factory MedicaFormatException.fromMessage(String message) {
    return MedicaFormatException(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory MedicaFormatException.formCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const MedicaFormatException('The email address format is invalid. Please enter a valid email');
      case 'invalid-phone-number-format':
        return const MedicaFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const MedicaFormatException('The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return const MedicaFormatException('The URL format is invalid. Please enter a valid URL');
      case 'invalid-credit-card-format':
        return const MedicaFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const MedicaFormatException('The input should be a valid numeric format.');
      default:
        return const MedicaFormatException('Invalid format. Please check and try again.');
    }
  }
}
