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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _appRouter = AppRouter.beamerDelegate;
    var _appRouteParser = AppRouter.beamerParser;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Router Settings
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
