import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:flutter/material.dart';

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
            InfoCard.light(label: AppText.expertisetext1l),
            Gap(8),
            InfoCard.dark(label: AppText.expertisetext1r),
            Expanded(child: SizedBox()),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Gap(16),
            InfoCard.dark(label: AppText.expertisetext2l),
            Expanded(child: SizedBox()),
            InfoCard.light(label: AppText.expertisetext1r),
            Gap(16),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Gap(32),
            InfoCard.light(label: AppText.expertisetext3l),
            Expanded(child: SizedBox()),
            InfoCard.dark(label: AppText.expertisetext3r),
            Gap(32),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Expanded(child: SizedBox()),
            InfoCard.dark(label: AppText.expertisetext4l),
            Gap(8),
            InfoCard.light(label: AppText.expertisetext4r),
            Expanded(child: SizedBox()),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Expanded(child: SizedBox()),
            InfoCard.light(label: AppText.expertisetext5),
            Expanded(child: SizedBox()),
          ],
        ),
        Spacer(flex: 3)
      ],
    );
  }
}
