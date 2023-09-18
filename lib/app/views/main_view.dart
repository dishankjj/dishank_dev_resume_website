import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/views/commons/position_dot_module/position_dot_module.dart';
import 'package:dishank_dev_resume_website/app/views/commons/web_header/web_header_module.dart';
import 'package:dishank_dev_resume_website/app/views/home_view/home_view.dart';
import 'package:flutter/material.dart';

class MainWebView extends StatefulWidget {
  const MainWebView({super.key});

  @override
  State<MainWebView> createState() => _MainWebViewState();
}

class _MainWebViewState extends State<MainWebView> {
  late Size size;
  late List<Widget> children;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpTo(0);
    });
  }

  void initalizer() {
    size = MediaQuery.sizeOf(context);
    children = [
      SizedBox(
        width: size.width,
        height: size.height,
        child: const WebHomeView(),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          color: const Color(WebColorAsset.bgBlack),
          child: const Placeholder(),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          color: const Color(WebColorAsset.bgBlack),
          child: const Placeholder(),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          color: const Color(WebColorAsset.bgBlack),
          child: const Placeholder(),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          color: const Color(WebColorAsset.bgBlack),
          child: const Placeholder(),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initalizer();

    return Material(
      child: Stack(children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          itemBuilder: (context, index) {
            return children[index];
          },
          itemCount: children.length,
        ),
        SizedBox(
          height: 150,
          width: size.width,
          child: WebHeaderModule(pageController),
        ),
        Align(
          alignment: const Alignment(0.975, 0.95),
          child: SizedBox(
            height: 100,
            width: 12,
            child: WebPositionDotModule(
              pageController,
              totalPages: children.length,
            ),
          ),
        )
      ]),
    );
  }
}
