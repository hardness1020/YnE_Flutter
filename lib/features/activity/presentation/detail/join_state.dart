import 'package:flutter_riverpod/flutter_riverpod.dart';

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
