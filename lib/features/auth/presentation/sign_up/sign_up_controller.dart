import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/auth/application/auth_service.dart';
import 'package:yne_flutter/features/auth/presentation/sign_up/sign_up_state.dart';


class SignUpController extends StateNotifier<SignUpState> {
  SignUpController({required this.authService}) : super(SignUpState());
  final AuthService authService;

  Future<bool> submit(String nickname, String email, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => authService.signUp(email: email, password: password),
    );
    state = state.copyWith(value: value);
    return value.hasError == false;
  }
}

final signUpControllerProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return SignUpController(authService: authService);
});
