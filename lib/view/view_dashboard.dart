// ignore_for_file: unused_import, implementation_imports

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:dishankdev/view/pages/about/about_page.dart';
import 'package:dishankdev/view/pages/footer/footer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'pages/info/info_page.dart';

class ViewDashboard extends StatefulWidget {
  const ViewDashboard({Key? key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: 'Dishank.Dev - The Flutter Developer',
        primaryColor: Theme.of(context).primaryColor.value,
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        pageSnapping: false,
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          IntroPage(pageController),
          const AboutPage(),
          FooterPage(pageController),
        ],
      ),
    );
  }
}
