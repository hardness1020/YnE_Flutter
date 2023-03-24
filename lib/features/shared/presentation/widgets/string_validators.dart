import 'package:flutter/services.dart';

/// This file contains some helper functions used for string validation.

abstract class StringValidator {
  //bool isValid(String value);
  bool isValid(String value1, [String? value2]);
}

class RegexValidator implements StringValidator {
  RegexValidator({required this.regexSource});
  final String regexSource;

  @override
  bool isValid(String value1, [String? value2]) {
    try {
      // https://regex101.com/
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value1);
      for (final match in matches) {
        if (match.start == 0 && match.end == value1.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  ValidatorInputFormatter({required this.editingValidator});
  final StringValidator editingValidator;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final bool oldValueValid = editingValidator.isValid(oldValue.text);
    final bool newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}

class EmailEditingRegexValidator extends RegexValidator {
  EmailEditingRegexValidator() : super(regexSource: '^(|\\S)+\$');
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator() : super(regexSource: '^\\S+@\\S+\\.\\S+\$');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value1, [String? value2]) {
    return value1.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value1, [String? value2]) {
    return value1.length >= minLength;
  }
}

class SameTwoStringValidator extends StringValidator {
  @override
  bool isValid(String value1, [String? value2]) {
    return value1 == value2;
  }
}
