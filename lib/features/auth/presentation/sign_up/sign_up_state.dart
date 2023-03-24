import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';


mixin SignUpValidators {
  final StringValidator nicknameValidator = NonEmptyStringValidator();
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordSubmitValidator = MinLengthStringValidator(8);
  final StringValidator confirmPasswordValidator = SameTwoStringValidator();
}

class SignUpState with SignUpValidators {
  SignUpState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  SignUpState copyWith({
    AsyncValue<void>? value,
  }) {
    return SignUpState(
      value: value ?? this.value,
    );
  }
}

extension SignUpStateX on SignUpState {
  bool canSubmitNickname(String nickname) {
    return nicknameValidator.isValid(nickname);
  }

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordSubmitValidator.isValid(password);
  }

  bool canSubmitConfirmPassword(String password, String confirmPassword) {
    return confirmPasswordValidator.isValid(password, confirmPassword);
  }

  String? nicknameErrorText(String nickname) {
    final bool showErrorText = !canSubmitNickname(nickname);
    final String errorText = nickname.isEmpty
        ? 'Nickname can\'t be empty'.hcd
        : 'Invalid Nickname'.hcd;
    return showErrorText ? errorText : null;
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
        : 'Password is too short'.hcd;
    return showErrorText ? errorText : null;
  }

  String? confirmPasswordErrorText(String? password, String confirmPassword) {
    final bool showErrorText =
        !canSubmitConfirmPassword(password ?? '', confirmPassword);
    final String errorText = confirmPassword.isEmpty
        ? 'Confirm Password can\'t be empty'.hcd
        : 'Confirm Password is not correct'.hcd;
    return showErrorText ? errorText : null;
  }
}
