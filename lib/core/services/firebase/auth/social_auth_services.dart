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
  static Future<bool> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();
      // Check if there is a user in googleUser
      if (googleUser == null) return false;
      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential

      await FirebaseAuth.instance.signInWithCredential(credential);

      return true;
    } catch (e) {
      log('Google Auth: $e');
      // CustomSnackBar.showCustomErrorSnackBar(
      //   title: 'Google authentication',
      //   message: 'Something went wrong.',
      // );
      return false;
    }
  }

  /// Facebook Auth.
  static Future<bool> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final loginResult = await FacebookAuth.instance.login();
      if (loginResult.status != LoginStatus.success) return false;
      // Create a credential from the access token
      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      return true;
    } catch (e) {
      log('Facebook Auth: $e');
      // CustomSnackBar.showCustomErrorSnackBar(
      //   title: 'Facebook authentication',
      //   message: 'Something went wrong.',
      // );
      return false;
    }
  }

  /// Apple Auth.
  static Future<bool> signInWithApple() async {
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

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return true;
    } catch (e) {
      log('Apple Auth: $e');
      // CustomSnackBar.showCustomErrorSnackBar(
      //   title: 'Apple authentication',
      //   message: 'Something went wrong.',
      // );
      return false;
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
