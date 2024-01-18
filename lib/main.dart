import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/modules/app/view/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  // Init SharedPreferences:
  await SharedPref.init();

  // App:
  runApp(const App());
}
