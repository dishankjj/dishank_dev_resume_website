import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/certification/platform/mobile_certification_view.dart';
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

