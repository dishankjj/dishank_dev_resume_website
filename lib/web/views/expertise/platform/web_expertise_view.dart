import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:flutter/material.dart';

class WebExpertiseView extends StatelessWidget {
  const WebExpertiseView({super.key});

  List<String> get expertiseList => [
        AppText.expertisetext1l,
        AppText.expertisetext1r,
        AppText.expertisetext2l,
        AppText.expertisetext2r,
        AppText.expertisetext3l,
        AppText.expertisetext3r,
        AppText.expertisetext4l,
        AppText.expertisetext4r,
        AppText.expertisetext5l,
        AppText.expertisetext5r,
      ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        const HeaderFill(space: 120),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppText.expertiseLabel,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  height: 0.5,
                ),
          ),
        ),
        const Gap(24),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(48),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16,
              spacing: 16,
              children: [
                ...List.generate(
                  expertiseList.length,
                  (index) {
                    if (index.isEven) {
                      return SizedBox(
                        width: size.width * 0.15,
                        height: 180,
                        child: InfoCard.dark(
                          label: expertiseList[index],
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: size.width * 0.15,
                        height: 180,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: InfoCard.light(
                            label: expertiseList[index],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
