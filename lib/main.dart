import 'package:dishankdev/router/app_router.gr.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  // setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GRecaptchaV3.ready("5LemQVodAAAAANDyqBXF6KQjzQtBeNonVBTm2Yk0",
  //     showBadge: true);
  await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LemQVodAAAAANDyqBXF6KQjzQtBeNonVBTm2Yk0');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Welcome!!',
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData.dark(),
    );
  }
}
