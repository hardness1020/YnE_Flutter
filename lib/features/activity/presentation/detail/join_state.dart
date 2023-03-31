import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';

/// Mixin class to be used for client-side email & password validation

/// State class for the email & password form.
class JoinState{
  JoinState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  JoinState copyWith({
    AsyncValue<void>? value,
  }) {
    return JoinState(
      value: value ?? this.value,
    );
  }
}
