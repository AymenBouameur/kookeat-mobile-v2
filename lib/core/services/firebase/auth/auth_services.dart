import 'dart:developer';

import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/data/models/user_model.dart';
import 'package:cookeat/core/services/firebase/auth/user_serviecs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  AuthServices._();

  /// Firebase normal sign in.
  static Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomSnackBar.showSnackBar(
          text: 'No user found for that email.',
          isError: true,
        );
      } else if (e.code == 'wrong-password') {
        CustomSnackBar.showSnackBar(
          text: 'Wrong password.',
          isError: true,
        );
      } else {
        CustomSnackBar.showSnackBar(
          text: 'Something went wrong.',
          isError: true,
        );
      }
      return false;
    }
  }

  /// Firebase normal sign up.
  static Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await UserServices.createUserDocument(
        user: UserModel(
          uid: credential.user!.uid,
          fullName: fullName,
          emailAddress: email,
          completeProfile: 0,
        ),
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomSnackBar.showSnackBar(
          text: 'The password provided is too weak.',
          isError: true,
        );
      } else if (e.code == 'email-already-in-use') {
        CustomSnackBar.showSnackBar(
          text: 'The account already exists for that email.',
          isError: true,
        );
      }
      return false;
    } catch (e) {
      log('Firebase sign up error: $e');
      return false;
    }
  }

  /// Firebase reset password.
  static Future<bool> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      return true;
    } on FirebaseException catch (e) {
      log('Password reset email error: $e');
      CustomSnackBar.showSnackBar(
        text: e.toString(),
        isError: true,
      );
      return false;
    }
  }

  /// Firebase sign out.
  static Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();

      await SharedPref.clear();
      await SharedPref.setOnBoardingPassed(isPassed: true);
      return true;
    } catch (e) {
      log('Logout error:$e');
      CustomSnackBar.showSnackBar(
        text: 'Something went wrong.',
        isError: true,
      );
      return false;
    }
  }
}
