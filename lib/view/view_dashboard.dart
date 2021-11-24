import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/about/about_page.dart';
import 'pages/footer/footer_page.dart';
import 'pages/header/header_page.dart';
import 'widgets/scrollbar_widget.dart';

class ViewDashboard extends StatefulWidget {
  const ViewDashboard({Key? key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  final PageController _pageController = PageController();
  double _offset = 0.0;

  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    Timer(Duration.zero, () {
      var media = MediaQuery.of(context);
      var orientation = media.orientation == Orientation.landscape;

      setState(() {
        _offset = (_pageController.offset / (orientation ? 2.25 : 2.15)) + 10;
      });
    });

    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: 'Dishank.Dev - The Flutter Developer',
        primaryColor: Theme.of(context).primaryColor.value,
      ),
    );

    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Scaffold(
              body: Center(
                child: Text('Error while loading the Firebase..'),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(
              children: [
                PageView(
                  pageSnapping: false,
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  children: [
                    HeaderPage(_pageController),
                    const AboutPage(),
                    FooterPage(_pageController),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: ScrollBar(
                      offset: _offset, pageController: _pageController),
                ),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
