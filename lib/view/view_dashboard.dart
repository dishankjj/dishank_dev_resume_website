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
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: 'Dishank.Dev - The Flutter Developer',
        primaryColor: Theme.of(context).primaryColor.value,
      ),
    );
    Timer(Duration.zero, () {
      setState(() {
        _offset = (_pageController.offset / 2.25) + 10;
      });
    });
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
          Container(
            alignment: Alignment.centerRight,
            height: MediaQuery.of(context).size.height,
            width: 20.0,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width - 20.0),
            decoration: const BoxDecoration(color: Colors.black12),
            child: Container(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Container(
                  height: 40.0,
                  width: 15.0,
                  margin: EdgeInsets.only(left: 5.0, right: 5.0, top: _offset),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(3.0))),
                ),
                onVerticalDragUpdate: (dragUpdate) {
                  _pageController.position
                      .moveTo(dragUpdate.globalPosition.dy * 2.25);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
