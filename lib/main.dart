import 'package:beamer/beamer.dart';
import 'package:dishankdev/constants.dart';
import 'package:dishankdev/firebase_options.dart';
import 'package:dishankdev/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        pageTransitionsTheme: NoTransitionsOnWeb(),
      ),
      darkTheme: ThemeData.dark(),
      // Localozation
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        FormBuilderLocalizations.delegate
      ],
    );
  }
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (kIsWeb) return child;
    return super
        .buildTransitions(route, context, animation, secondaryAnimation, child);
  }
}
