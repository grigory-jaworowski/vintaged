class VFormatException implements Exception {
  final String message;

  const VFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  factory VFormatException.fromMessage(String message) {
    return VFormatException(message);
  }

  String get formattedMessage => message;

  factory VFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const VFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const VFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const VFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const VFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const VFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const VFormatException('The input should be a valid numeric format.');
      default:
        return const VFormatException();
    }
  }
}