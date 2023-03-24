import 'package:firebase_auth/firebase_auth.dart';

import 'package:yne_flutter/features/auth/data/interface/intf_auth_repo.dart';


class FakeAuthRepo extends IntfAuthRepo {
  @override
  // TODO: implement currentUser
  User? get currentUser => throw UnimplementedError();
  
  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
  
  @override
  Future<UserCredential> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }
  
  @override
  Future<UserCredential> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
  
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
  
  @override
  Future<void> update({String? displayName, String? email}) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<void> updatePassword({required String password}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
  
  @override
  Stream<User?> watchUser() {
    // TODO: implement watchUser
    throw UnimplementedError();
  }
  
  @override
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
  
  @override
  Future<void> createUserWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
  
  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateEmail({required String email, required String password}) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateProfile({String? displayName}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  
  @override
  Future<UserCredential?> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }
}