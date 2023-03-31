import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/shared/presentation/widgets/string_validators.dart';

/// Mixin class to be used for client-side email & password validation

/// State class for the email & password form.
class LikeState{
  LikeState({
    this.value = const AsyncValue.data(null),
  });

  final AsyncValue<void> value;

  bool get isLoading => value.isLoading;

  LikeState copyWith({
    AsyncValue<void>? value,
  }) {
    return LikeState(
      value: value ?? this.value,
    );
  }
}
