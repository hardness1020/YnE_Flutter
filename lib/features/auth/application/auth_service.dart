import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/features/auth/data/interface/intf_auth_repo.dart';

class AuthService {
  final Ref ref;

  AuthService(this.ref);

  User? get currentUser {
    final authRepo = ref.read(authRepoProvider);
    return authRepo.currentUser;
  }

  Future<UserCredential?> signInAnonymously() async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.signInAnonymously();
  }

  Future<void> signUp({required String email, required String password}) async {
    final authRepo = ref.read(authRepoProvider);
    await authRepo.createUserWithEmailAndPassword(
        email: email, password: password);
    await authRepo.sendEmailVerification();
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.sendPasswordResetEmail(email: email);
  }

  Future<void> updateProfile({String? displayName}) async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.updateProfile(displayName: displayName);
  }

  Future<void> updateEmail(
      {required String email, required String password}) async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.updateEmail(email: email, password: password);
  }

  Future<void> updatePassword({required String password}) async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.updatePassword(password: password);
  }

  Future<void> sendEmailVerification() async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.sendEmailVerification();
  }

  Future<void> signOut() async {
    final authRepo = ref.read(authRepoProvider);
    return await authRepo.signOut();
  }
}


final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});
