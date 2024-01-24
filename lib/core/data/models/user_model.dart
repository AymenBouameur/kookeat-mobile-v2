import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.completeProfile,
  });
  UserModel.getUser({
    required Map<String, dynamic> data,
  }) {
    uid =
        data['uid'] as String? ?? FirebaseAuth.instance.currentUser?.uid ?? '';
    firstName = data['firstName'] as String? ?? '';
    lastName = data['lastName'] as String? ?? '';
    emailAddress = data['emailAddress'] as String? ?? '';
    completeProfile = data['completeProfile'] as int? ?? 0;
  }
  String? uid;
  int? completeProfile;
  String? firstName;
  String? lastName;
  String? emailAddress;
  Map<String, dynamic> setUser(UserModel user) {
    final data = <String, dynamic>{};

    data['uid'] = user.uid;
    data['firstName'] = user.firstName;
    data['lastName'] = user.lastName;
    data['emailAddress'] = user.emailAddress;
    data['completeProfile'] = user.completeProfile;

    return data;
  }
}
