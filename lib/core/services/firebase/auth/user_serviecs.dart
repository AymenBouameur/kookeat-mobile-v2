import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookeat/core/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  UserServices._();

  ///// create a user in firestore
  static Future<bool> createUserDocument({
    required UserModel user,
    String? userId,
  }) async {
    try {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      // submit user information to firestore.
      await usersCollection.doc(user.uid ?? userId).set(
            user.setUser(
              user,
            ),
          );

      log('Create user document (success).');
      return true;
    } catch (e) {
      log('Create user document error: $e');
      return false;
    }
  }

  /// get current user document
  static Future<UserModel?> getCurrentUserDocument() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      final user = UserModel.getUser(
        data: (snapshot.data() as Map<String, dynamic>?) ?? {},
      );

      if (user == UserModel()) {
        log('Get current user from document (empty).');
        return null;
      }

      log('Get current user from document (success).');
      return user;
    } catch (e) {
      log('Get current user from document error:$e');
      return null;
    }
  }

  /// Update user document
  static Future<bool> updateUserDocument({
    required UserModel user,
    String? documentId,
  }) async {
    try {
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('users');
      final document = collection.doc(
        documentId ?? FirebaseAuth.instance.currentUser?.uid,
      );

      // Update the specific field
      await document.update(UserModel().setUser(user));

      log('User document updated successfully');
      return true;
    } catch (e) {
      log('Error updating user document: $e');
      return false;
    }
  }
}
