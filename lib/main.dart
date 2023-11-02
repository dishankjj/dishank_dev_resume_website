import 'package:dishank_dev_resume_website/web/app.dart';
import 'package:dishank_dev_resume_website/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  incrementCount();

  runApp(const WebApp());
}

Future<void> incrementCount() async {
  final ref = FirebaseDatabase.instance.ref('count');

  final res = await ref.onValue.first;

  final data = res.snapshot.value as num;
  await ref.set(data + 1);
}
