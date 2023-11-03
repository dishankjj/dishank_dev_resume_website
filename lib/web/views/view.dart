import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/certification/certification_view.dart';
import 'package:dishank_dev_resume_website/web/views/commons/position_dot_module/position_dot_module.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/header_view.dart';
import 'package:dishank_dev_resume_website/web/views/contact/contact_view.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/expertise_view.dart';
import 'package:dishank_dev_resume_website/web/views/home/home_view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late Size size;
  late List<Widget> children;

  late final PageController pageController;
  late final OverlayPortalController _menuButtonCtrl;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    _menuButtonCtrl = OverlayPortalController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate);
      initalizer();
    });
  }

  @override
  void didChangeDependencies() {
    initalizer();
    super.didChangeDependencies();
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
        child: const ExpertiseView(),
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
            color: Color(AppColor.bgBlack),
          ),
          child: context.layout(
            mobile: const RestrictView(withBg: false),
            tablet: const RestrictView(),
            web: const RestrictView(),
          ),
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const CertificationView(),
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
    return GestureDetector(
      onTap: () {
        _menuButtonCtrl.hide();
      },
      child: Material(
        type: MaterialType.transparency,
        child: Stack(children: [
          PageView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            controller: pageController,
            itemBuilder: (context, index) {
              return children[index];
            },
            itemCount: children.length,
          ),
          HeaderView(
            key: AppGlobalKey.headerKey,
            pageController,
            _menuButtonCtrl,
          ),
          PageDotModule(
            pageController,
            totalPages: children.length,
          )
        ]),
      ),
    );
  }
}
