import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/firebase_options.dart';
import 'package:cookeat/modules/app/view/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();

  // Init SharedPreferences:
  await SharedPref.init();

  // Init Firebase:
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // App:
  runApp(const App());
}
