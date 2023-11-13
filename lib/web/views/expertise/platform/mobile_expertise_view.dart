import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:flutter/material.dart';

class MobileExpertiseView extends StatelessWidget {
  const MobileExpertiseView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        const HeaderFill(space: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppText.expertiseLabel,
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
                  margin: const EdgeInsets.only(right: 24),
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
        const Gap(16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: GridView(
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2,
              ),
              children: const [
                InfoCard.light(label: AppText.expertisetext1l),
                InfoCard.dark(label: AppText.expertisetext1r),
                InfoCard.dark(label: AppText.expertisetext2l),
                InfoCard.light(label: AppText.expertisetext2r),
                InfoCard.light(label: AppText.expertisetext3l),
                InfoCard.dark(label: AppText.expertisetext3r),
                InfoCard.dark(label: AppText.expertisetext4l),
                InfoCard.light(label: AppText.expertisetext4r),
                InfoCard.light(label: AppText.expertisetext5l),
                InfoCard.dark(label: AppText.expertisetext5r),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
