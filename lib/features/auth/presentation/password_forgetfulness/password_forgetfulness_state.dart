import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';


/// Mixin class to be used for client-side email & password validation
mixin PasswordForgetfulnessValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
}

/// State class for the email & password form.
class PasswordForgetfulnessState with PasswordForgetfulnessValidators {
  PasswordForgetfulnessState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  PasswordForgetfulnessState copyWith({
    AsyncValue<void>? value,
  }) {
    return PasswordForgetfulnessState(
      value: value ?? this.value,
    );
  }
}

extension PasswordForgetfulnessStateX on PasswordForgetfulnessState {
  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText =
        email.isEmpty ? 'Email can\'t be empty'.hcd : 'Invalid email'.hcd;
    return showErrorText ? errorText : null;
  }
}
