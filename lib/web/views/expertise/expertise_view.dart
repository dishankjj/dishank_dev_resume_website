import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/material.dart';

class ExpertiseView extends StatefulWidget {
  const ExpertiseView({super.key});

  @override
  State<ExpertiseView> createState() => _ExpertiseViewState();
}

class _ExpertiseViewState extends State<ExpertiseView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(WebImageAssets.background2),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: const MobileExpertiseView(),
        tablet: const RestrictView(withBg: false),
        web: const RestrictView(withBg: false),
      ),
    );
  }
}

class MobileExpertiseView extends StatelessWidget {
  const MobileExpertiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderFill(spacer: 32),
        Row(
          children: [
            Expanded(child: SizedBox()),
            InfoCard.light(label: 'Flutter'),
            Gap(8),
            InfoCard.dark(label: 'Riverpod'),
            Expanded(child: SizedBox()),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Gap(16),
            InfoCard.dark(label: 'Dart'),
            Expanded(child: SizedBox()),
            InfoCard.light(label: 'E2E'),
            Gap(16),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Gap(32),
            InfoCard.light(label: 'iOS/\nAndroid'),
            Expanded(child: SizedBox()),
            InfoCard.dark(label: 'Git\nFastlane'),
            Gap(32),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Expanded(child: SizedBox()),
            InfoCard.dark(label: 'Cloud Computing'),
            Gap(8),
            InfoCard.light(label: 'Mobile Dev'),
            Expanded(child: SizedBox()),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Expanded(child: SizedBox()),
            InfoCard.light(label: 'Aws\nFirebase'),
            Expanded(child: SizedBox()),
          ],
        ),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
