import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/views/commons/buttons/buttton_highlight_on_hover.dart';
import 'package:dishank_dev_resume_website/app/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScheduleNowModule extends StatelessWidget {
  const ScheduleNowModule({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Align(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(WebColorAsset.bgWhite),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(size.width * 0.015),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap.width(48 * 2),
            Text(
              'Interested in working together? Let’s plan a conversation',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(WebColorAsset.bgBlack),
                  ),
            ),
            const Gap(48),
            ButtonHighlightOnHover.light(
              'Schedule Now',
              callback: () => launchUrlString(
                'https://topmate.io/dishankjindal',
                mode: LaunchMode.externalApplication,
              ),
            ),
            const Gap.width(48 * 2),
          ],
        ),
      ),
    );
  }
}
