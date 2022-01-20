import 'package:beamer/beamer.dart';
import 'package:dishankdev/view/view_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as web;

class AppRouter {
  static BeamerParser beamerParser = BeamerParser();
  static BeamerDelegate beamerDelegate = BeamerDelegate(
    initialPath: "/welcome-you",
    locationBuilder: RoutesLocationBuilder(
      routes: {
        "/welcome-you": (context, state, data) => CustomBeamPage.homePage,
      },
    ),
    notFoundRedirectNamed: "/welcome-you",
    notFoundPage: CustomBeamPage.unknownPage,
  );
}

class CustomBeamPage {
  static BeamPage homePage = const BeamPage(
    key: ValueKey('home-page'),
    title: 'Flutter Developer',
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
            child: Image.asset('assets/animation_loader.gif')),
      ),
    ),
  );
}
