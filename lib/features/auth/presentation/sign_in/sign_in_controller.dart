import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/auth/presentation/sign_in/sign_in_state.dart';
import 'package:yne_flutter/features/auth/application/auth_service.dart';


class SignInController extends StateNotifier<SignInState> {
  SignInController({required this.authService}) : super(SignInState());
  final AuthService authService;

  Future<bool> submit(String email, String password) async {
    state = state.copyWith(value: const AsyncValue.loading());
    final value = await AsyncValue.guard(
      () => authService.signInWithEmailAndPassword(email: email, password: password),
    );
    state = state.copyWith(value: value);
    return value.hasError == false;
  }
}

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return SignInController(authService: authService);
});
