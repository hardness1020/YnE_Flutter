import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yne_flutter/app_config.dart';
import 'package:yne_flutter/features/auth/data/fake/fake_auth_repo.dart';
import 'package:yne_flutter/features/auth/data/firebase/firebase_auth_repo.dart';

abstract class IntfAuthRepo {
  User? get currentUser;
  Stream<User?> watchUser();

  // Method1
  Future<UserCredential?> signInAnonymously();

  // Method2
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password});

  // // Method3
  // Future<void> sendSignInLinkToEmail({required String email});

  // // Method4
  // Future<UserCredential> signInWithGoogle();

  // // Method5
  // Future<UserCredential> signInWithFacebook();

  // TODO: avatar update. email not verified
  Future<void> updateProfile({String? displayName});
  Future<void> updateEmail({required String email, required String password});
  Future<void> updatePassword({required String password});
  Future<void> sendPasswordResetEmail({required String email});
  Future<void> sendEmailVerification();
  Future<void> signOut();
}

final authRepoProvider = Provider<IntfAuthRepo>((ref) {
  // final authRepo = kUseFakeRepos ? FakeAuthRepo() : FirebaseAuthRepo();
  final authRepo = kUseFakeRepos ? FirebaseAuthRepo() : FirebaseAuthRepo();
  return authRepo;
});

final userStreamProvider = StreamProvider<User?>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return authRepo.watchUser();
});
