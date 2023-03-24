import 'package:firebase_auth/firebase_auth.dart';

import 'package:yne_flutter/features/auth/data/interface/intf_auth_repo.dart';

class FirebaseAuthRepo extends IntfAuthRepo {
  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Stream<User?> watchUser() {
    return FirebaseAuth.instance.userChanges();
  }

  @override
  Future<UserCredential?> signInAnonymously() async {
    try {
      return await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          // print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
        // print("Unknown error.");
      }
    }
    return null;
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile({String? displayName}) async {
    if (displayName != null) {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
    }
  }

  @override
  Future<void> updateEmail(
      {required String email, required String password}) async {
    await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: FirebaseAuth.instance.currentUser!.email!,
        password: password,
      ),
    );
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
  }

  @override
  Future<void> updatePassword({required String password}) async {
    await FirebaseAuth.instance.currentUser!.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: FirebaseAuth.instance.currentUser!.email!,
        password: password,
      ),
    );
    await FirebaseAuth.instance.currentUser!.updatePassword(password);
  }

  @override
  Future<void> sendEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
