import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';

/// Mixin class to be used for client-side email & password validation
mixin SignInValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordSubmitValidator = NonEmptyStringValidator();
}

/// State class for the email & password form.
class SignInState with SignInValidators {
  SignInState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  SignInState copyWith({
    AsyncValue<void>? value,
  }) {
    return SignInState(
      value: value ?? this.value,
    );
  }
}

extension SignInStateX on SignInState {
  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText =
        email.isEmpty ? 'Email can\'t be empty'.hcd : 'Invalid email'.hcd;
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final bool showErrorText = !canSubmitPassword(password);
    final String errorText = password.isEmpty
        ? 'Password can\'t be empty'.hcd
        : 'Invalid Password'.hcd;
    return showErrorText ? errorText : null;
  }
}
