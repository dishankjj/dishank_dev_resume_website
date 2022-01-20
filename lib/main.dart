import 'package:beamer/beamer.dart';
import 'package:dishankdev/firebase_options.dart';
import 'package:dishankdev/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Beamer.setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter.beamerDelegate;
  final _appRouteParser = AppRouter.beamerParser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Main Material App
      title: 'Flutter Developer',
      routeInformationParser: _appRouteParser,
      routerDelegate: _appRouter,
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: _appRouter),
      // Theme settings
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
