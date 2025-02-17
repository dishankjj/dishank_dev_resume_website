import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/platform/mobile_header_view.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/platform/web_header_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  HeaderView(this.pageController, this.menuButtonCtrl, {super.key});

  final PageController pageController;
  final OverlayPortalController menuButtonCtrl;

  late final Map<String, VoidCallback> headerMenuItems = <String, VoidCallback>{
    AppText.home: () => pageController.jumpToPage(0),
    AppText.expertise: () => pageController.jumpToPage(1),
    AppText.experience: () => pageController.jumpToPage(2),
    AppText.certification: () => pageController.jumpToPage(3),
    AppText.contact: () => pageController.jumpToPage(4),
  };

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(AppColor.bgBlack),
        boxShadow: <BoxShadow>[BoxShadow(blurRadius: 16, spreadRadius: 4)],
      ),
      child: context.layout(
        mobile: MobileHeaderView(
          key: AppGlobalKey.headerKey,
          pageController,
          menuItems: headerMenuItems,
          menuButtonCtrl: menuButtonCtrl,
        ),
        tablet: const SizedBox(),
        web: WebHeaderView(
          key: AppGlobalKey.headerKey,
          pageController,
          menuItems: headerMenuItems,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<PageController>('pageController', pageController),
      )
      ..add(
        DiagnosticsProperty<OverlayPortalController>(
          'menuButtonCtrl',
          menuButtonCtrl,
        ),
      )
      ..add(
        DiagnosticsProperty<Map<String, VoidCallback>>(
          'headerMenuItems',
          headerMenuItems,
        ),
      );
  }
}
