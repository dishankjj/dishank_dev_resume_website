import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/platform/mobile_expertise_view.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/platform/web_expertise_view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/material.dart';

class ExpertiseView extends StatefulWidget {
  const ExpertiseView({super.key});

  @override
  State<ExpertiseView> createState() => _ExpertiseViewState();
}

class _ExpertiseViewState extends State<ExpertiseView> {
  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ImageAssets.background2),
          fit: BoxFit.cover,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: const MobileExpertiseView(),
        tablet: const RestrictView(withBg: false),
        web: const WebExpertiseView(),
      ),
    );
  }
}
