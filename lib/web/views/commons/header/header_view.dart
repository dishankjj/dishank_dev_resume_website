import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/platform/mobile_header_view.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  final PageController pageController;
  final OverlayPortalController menuButtonCtrl;

  HeaderView(
    this.pageController,
    this.menuButtonCtrl, {
    super.key,
  });

  late final Map<String, VoidCallback> headerMenuItems = {
    AppText.home: () => pageController.jumpToPage(0),
    AppText.expertise: () => pageController.jumpToPage(1),
    AppText.experience: () => pageController.jumpToPage(2),
    AppText.certification: () => pageController.jumpToPage(3),
    AppText.contact: () => pageController.jumpToPage(4),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: MobileHeaderView(
          pageController,
          menuItems: headerMenuItems,
          menuButtonCtrl: menuButtonCtrl,
        ),
        tablet: const SizedBox(),
        web: const SizedBox(),
      ),
    );
  }
}
