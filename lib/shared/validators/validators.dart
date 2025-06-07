import 'package:intl/intl.dart';

class Validators {
  static String? notEmptyValidator(String? value, String? labelText) {
    if (value == null || value.isEmpty) {
      return "Please enter $labelText";
    }
    return null;
  }

  static String? emailValidator(String? value, String labelText) {
    if (value == null || value.isEmpty) {
      return "Please enter $labelText";
    } else if (!value.contains("@")) {
      return "Please enter valid $labelText";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final List<String> errors = [];

    if (value.length < 8) {
      errors.add('• At least 8 characters');
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errors.add('• One uppercase letter');
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      errors.add('• One lowercase letter');
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      errors.add('• One number');
    }

    if (!RegExp(r'[!@#\$&*~_]').hasMatch(value)) {
      errors.add('• One special character (!@#\$&*~_)');
    }

    if (errors.isEmpty) return null;

    return 'Password must have:\n${errors.join('\n')}';
  }

  static String? confirmPasswordValidator(
    String? value,
    String labelText,
    String passwordValue,
  ) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value != passwordValue) {
      return "Password don't match.";
    }
    return null;
  }

  static String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  static String? dOBValidator(String? value, String labelText) {
    if (value == null || value.isEmpty) {
      return '$labelText is required';
    }

    final int dOBYear = DateFormat("dd-MM-yyyy").parse(value).year;
    final int currentDateYear = DateTime.now().year;

    if (dOBYear > currentDateYear - 14) {
      return "Enter valid DOB / age > 14";
    }

    return null;
  }

  static String? passingYearValidator(String? value, String labelText) {
    if (value == null || value.isEmpty) {
      return '$labelText is required';
    }

    final isInt = int.tryParse(value);

    if (isInt == null) {
      return "Enter valid integer";
    }

    final currentYear = DateTime.now().year;
    if (isInt < 1947 || isInt > currentYear + 5) {
      return "Enter valid passing year";
    }

    return null;
  }
}
