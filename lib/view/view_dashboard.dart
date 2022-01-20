import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'pages/about/about_page.dart';
import 'pages/footer/footer_page.dart';
import 'pages/header/header_page.dart';
import 'pages/header/widgets/full_screen_background_image_widget.dart';
import 'widgets/back_to_top_icon_widget.dart';

class ViewDashboard extends StatefulWidget {
  const ViewDashboard({Key? key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  final ScrollController _scrollController = ScrollController();

  List<Widget> _pages = [];
  bool _checkScrolledDown = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _checkScrolledDown = _scrollController.position.pixels >= 100;
      });
    });

    _pages = [
      const HeaderPage(),
      const AboutPage(),
      const FooterPage(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const FullScreenBackgroundImage(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: Column(
                children: _pages,
              ),
            ),
          ),
          if (_checkScrolledDown)
            Container(
              color: Colors.black.withOpacity(0.75),
              height: MediaQuery.of(context).size.height * 0.25 / 2,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: const [
                  Spacer(),
                  FlutterLogo(),
                  AutoSizeText('Dishank.Dev'),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  HeaderButtonWidget(
                    message: 'GitHub',
                    urlString: 'https://github.com/dishankjj',
                  ),
                  Spacer(),
                  HeaderButtonWidget(
                    message: 'LinkedIn',
                    urlString: 'https://www.linkedin.com/in/dishankjindal/',
                  ),
                  Spacer(),
                  HeaderButtonWidget(
                    message: 'Resume',
                    urlString:
                        'https://drive.google.com/file/d/1V2VO29NJ0ahDDzYy16KqLc_XJfWAfwtY/view?usp=sharing',
                  ),
                  Spacer(),
                  HeaderButtonWidget(
                    message: 'Hire Me',
                    urlString: 'https://www.freelancer.com/u/dishankakadj',
                  ),
                  Spacer(),
                ],
              ),
            ),
          BackToTopIconWidget(_jumpPageToStart, _checkScrolledDown),
        ],
      ),
    );
  }

  _jumpPageToStart() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }

  // _onVerticalDragUpdateMethod(DragUpdateDetails dragUpdate) {
  //   if (_pageController.hasClients) {
  //     _pageController.position
  //         .moveTo(dragUpdate.globalPosition.dy * _scrollOffsetRatio);
  //   }
  // }
}
