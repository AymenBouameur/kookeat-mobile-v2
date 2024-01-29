import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    this.uid,
    this.fullName,
    this.emailAddress,
    this.completeProfile,
  });

  UserModel.getUser({
    required Map<String, dynamic> data,
  }) {
    uid =
        data['uid'] as String? ?? FirebaseAuth.instance.currentUser?.uid ?? '';
    fullName = data['fullName'] as String? ?? '';
    emailAddress = data['emailAddress'] as String? ?? '';
    completeProfile = data['completeProfile'] as int? ?? 0;
  }
  String? uid;
  int? completeProfile;
  String? fullName;

  String? emailAddress;
  Map<String, dynamic> setUser(UserModel user) {
    final data = <String, dynamic>{};

    data['uid'] = user.uid;
    data['fullName'] = user.fullName;
    data['emailAddress'] = user.emailAddress;
    data['completeProfile'] = user.completeProfile;

    return data;
  }
}
