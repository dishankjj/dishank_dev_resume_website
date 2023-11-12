import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/shared/mobile_menu_overlay.dart';
import 'package:dishank_dev_resume_website/web/views/commons/header/shared/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MobileHeaderView extends StatefulWidget {
  final PageController pageController;
  final Map<String, VoidCallback> menuItems;
  final OverlayPortalController menuButtonCtrl;

  const MobileHeaderView(
    this.pageController, {
    required this.menuItems,
    required this.menuButtonCtrl,
    super.key,
  });

  @override
  State<MobileHeaderView> createState() => _MobileHeaderViewState();
}

class _MobileHeaderViewState extends State<MobileHeaderView> {
  late final MaterialStatesController buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = MaterialStatesController();
  }

  @override
  void dispose() {
    buttonState.dispose();
    widget.menuButtonCtrl.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
        controller: widget.menuButtonCtrl,
        overlayChildBuilder: (context) {
          return MobileMenuOverlay(
            child: DropDownMenuWidget(
              widget.pageController,
              headerMenuItems: widget.menuItems,
              menuButtonCtrl: widget.menuButtonCtrl,
            ),
          );
        },
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Row(
            children: [
              const Image(image: AssetImage(WebImageAssets.logo)),
              const Spacer(),
              AppCircleButton(
                label: AppText.pingMe,
                labelStyle: Theme.of(context).textTheme.headlineSmall,
                callback: () => launchUrlString(
                  AppUrl.linkedin,
                  mode: LaunchMode.externalApplication,
                ),
                highlightColor: AppColor.bgYellow,
                borderColor: AppColor.bgYellow,
                borderRadius: 24,
              ),
              const Gap.w(24),
              InkWell(
                key: UniqueKey(),
                onTap: () => widget.menuButtonCtrl.toggle(),
                child: Image(
                  key: AppGlobalKey.menuKey,
                  image: const AssetImage(WebImageAssets.menu),
                ),
              ),
            ],
          ),
        ));
  }
}
