import 'package:beamer/beamer.dart';
import 'package:dishankdev/view/view_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as web;

class AppRouter {
  static BeamerParser beamerParser = BeamerParser();
  static BeamerDelegate beamerDelegate = BeamerDelegate(
    initialPath: "/",
    locationBuilder: RoutesLocationBuilder(
      routes: {
        "/": (context, state, data) => CustomBeamPage.homePage,
        "/add": (context, state, data) => CustomBeamPage.add,
      },
    ),
    guards: [
      BeamGuard(
        pathPatterns: ["/add", "/add/*"],
        check: (context, location) => false,
        beamToNamed: (origin, target) => '/welcome-you',
      ),
    ],
    // notFoundPage: CustomBeamPage.unknownPage,
    notFoundRedirectNamed: "/",
  );
}

class CustomBeamPage {
  static BeamPage homePage = const BeamPage(
    key: ValueKey('home-page'),
    title: 'Dishank Jindal | Flutter Developer',
    child: ViewDashboard(),
  );

  static BeamPage add = const BeamPage(
    key: ValueKey('add-page'),
    title: 'Add New Post',
    child: ViewDashboard(),
  );

  static BeamPage unknownPage = BeamPage(
    key: const ValueKey('not-found'),
    title: 'Not Found',
    child: Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await web.launch('https://dishank.dev');
          },
          child: const Text('Click me'),
        ),
      ),
    ),
  );
}
