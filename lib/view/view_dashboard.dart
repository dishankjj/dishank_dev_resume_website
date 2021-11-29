import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/about/about_page.dart';
import 'pages/footer/footer_page.dart';
import 'pages/header/header_page.dart';
import 'widgets/back_to_top_icon_widget.dart';
import 'widgets/scrollbar_widget.dart';

class ViewDashboard extends StatefulWidget {
  const ViewDashboard({Key? key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  final PageController _pageController = PageController();

  List<Widget> _pages = [];
  double _scrollOffset = 0.0;
  double _scrollOffsetRatio = 0.0;
  bool _checkScrolledDown = false;

  @override
  void initState() {
    super.initState();

    // PageController Listener
    _pageController.addListener(() {
      setState(() {
        // Formula for getting the exact position of the scroll bar location
        // pixels represent the how much we scrolled down
        // maxscroll/viewport give me the ratio
        // i was multiplying 1.15 because i want to give down padding to scroll bar
        // If i have 100% screen to how scroll bar, i am basically taking away 15%
        // 5% from top and bottom, and 5% scroll bar icon height.
        // Because, there is some height of scroll bar icon itself.
        // the final formula is just dividing the pixels with the dynamic value
        // to stay with 85% range of scroll to represent the max scroll limit
        _scrollOffsetRatio = (_pageController.position.maxScrollExtent /
                _pageController.position.viewportDimension) *
            1.135;
        _scrollOffset = _pageController.position.pixels / _scrollOffsetRatio;
        _checkScrolledDown = _pageController.position.minScrollExtent <= 200;
      });
    });

    // This peace of code takes Pages Widget
    // as input to be shown on main Page
    _pages = [
      HeaderPage(_pageController),
      const AboutPage(),
      FooterPage(_pageController),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This peace of code "Dynamically"
    // Changes Chrome title
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
            children: _pages,
          ),
          Positioned(
            right: 0,
            child: ScrollBarWidget(
              _onVerticalDragUpdateMethod,
              _scrollOffset + 15,
            ),
          ),
          BackToTopIconWidget(_jumpPageToStart, _checkScrolledDown),
        ],
      ),
    );
  }

  _jumpPageToStart() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(0,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  _onVerticalDragUpdateMethod(DragUpdateDetails dragUpdate) {
    if (_pageController.hasClients) {
      _pageController.position
          .moveTo(dragUpdate.globalPosition.dy * _scrollOffsetRatio);
    }
  }
}
