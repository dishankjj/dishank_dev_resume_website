import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/app/views/commons/position_dot_module/position_dot_module.dart';
import 'package:dishank_dev_resume_website/app/views/commons/web_header/web_header_module.dart';
import 'package:dishank_dev_resume_website/app/views/contact_view/contact_view.dart';
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
        child: const HomeView(),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(WebImageAssets.background2),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            color: Color(WebColorAsset.bgBlack),
          ),
          child: Text(
            'Working on it...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(shadows: [
              const Shadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
            ]),
          ),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(WebImageAssets.background3),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            color: Color(WebColorAsset.bgBlack),
          ),
          child: Text(
            'Working on it...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(shadows: [
              const Shadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
            ]),
          ),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(WebImageAssets.background4),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            color: Color(WebColorAsset.bgBlack),
          ),
          child: Text(
            'Working on it...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(shadows: [
              const Shadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
            ]),
          ),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const ContactView(),
      ),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
        WebHeaderModule(pageController),
        WebPositionDotModule(
          pageController,
          totalPages: children.length,
        )
      ]),
    );
  }
}
