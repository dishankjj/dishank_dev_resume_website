// ignore_for_file: unused_import, implementation_imports

import 'dart:async';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dishankdev/view/pages/about/about_page.dart';
import 'package:dishankdev/view/pages/footer/footer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'pages/info/info_page.dart';
import 'widgets/scrollbar_widget.dart';

class ViewDashboard extends StatefulWidget {
  const ViewDashboard({Key? key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  final PageController _pageController = PageController();
  double _offset = 0.0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    Timer(Duration.zero, () {
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

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          PageView(
            pageSnapping: false,
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: [
              IntroPage(_pageController),
              const AboutPage(),
              FooterPage(_pageController),
            ],
          ),
          Positioned(
            right: 0,
            child: ScrollBar(offset: _offset, pageController: _pageController),
          ),
        ],
      ),
    );
  }
}
