import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;
import 'package:crypto/crypto.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialAuthServices {
  SocialAuthServices._();

  /// Google Auth.
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();
      // Check if there is a user in googleUser
      if (googleUser == null) return null;
      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential

      final userCredentials = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return userCredentials;
    } catch (e) {
      log('Google Auth error : $e');
      return null;
    }
  }

  /// Facebook Auth.
  static Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success) return null;
      // Create a credential from the access token
      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      final userCredentials = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return userCredentials;
    } catch (e) {
      log('Facebook Auth error : $e');
      return null;
    }
  }

  /// Apple Auth.
  static Future<UserCredential?> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );

      final userCredentials =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return userCredentials;
    } catch (e) {
      log('Apple Auth error : $e');
      return null;
    }
  }

  /// Log out from firebase.
  static Future<bool> logOutFromFirebase() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();

      return true;
    } catch (e) {
      log('Log out from firebase error: $e');
      return false;
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
