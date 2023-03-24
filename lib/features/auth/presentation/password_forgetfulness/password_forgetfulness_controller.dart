import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/auth/application/auth_service.dart';
import 'package:yne_flutter/features/auth/presentation/password_forgetfulness/password_forgetfulness_state.dart';


class PasswordForgetfulnessController
    extends StateNotifier<PasswordForgetfulnessState> {
  PasswordForgetfulnessController({required this.authService})
      : super(PasswordForgetfulnessState());
  final AuthService authService;

  Future<bool> submit(String email) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => authService.sendPasswordResetEmail(email: email),
    );
    state = state.copyWith(value: value);
    return value.hasError == false;
  }
}

final passwordForgetfulnessControllerProvider =
    StateNotifierProvider.autoDispose<PasswordForgetfulnessController,
        PasswordForgetfulnessState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return PasswordForgetfulnessController(authService: authService);
});
