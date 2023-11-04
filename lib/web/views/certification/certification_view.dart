import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/material.dart';

class CertificationView extends StatelessWidget {
  final PageController rootPageController;

  const CertificationView({
    required this.rootPageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(WebImageAssets.background4),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: MobileCertificationView(rootPageController: rootPageController),
        tablet: const RestrictView(),
        web: const RestrictView(),
      ),
    );
  }
}

class MobileCertificationView extends StatelessWidget {
  final PageController rootPageController;

  const MobileCertificationView({
    required this.rootPageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final children = [
      const HeaderFill(spacer: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.certificationtext1,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      height: 0.5,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: size.width * 0.5,
                height: 1,
                margin: const EdgeInsets.only(left: 24),
                color: const Color(AppColor.bgYellow),
              ),
            ),
            const Gap(4),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: size.width * 0.5,
                height: 1,
                margin: const EdgeInsets.only(right: 48),
                color: const Color(AppColor.bgYellow),
              ),
            ),
          ],
        ),
      ),
      const Gap(48),
      for (var i = 0; i < 9; i++) ...[
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              color: Color(AppColor.bgYellow),
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Image.network(
            AppUrl.certificateUrl(i),
            fit: BoxFit.contain,
          ),
        ),
        const Gap(48),
      ],
    ];

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.atEdge) {
          if (notification.metrics.pixels ~/
                  notification.metrics.maxScrollExtent >=
              notification.metrics.maxScrollExtent / 2) {
            rootPageController.animateTo(
              rootPageController.offset - 50,
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
            );
          } else {
            rootPageController.animateTo(
              rootPageController.offset + 50,
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
            );
          }
        }
        return true;
      },
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: children,
      ),
    );
  }
}
