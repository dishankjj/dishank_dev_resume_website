import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/contact/platform/mobile_contact_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/contact/be_in_touch_module.dart';
import 'package:dishank_dev_resume_website/web/views/contact/schedule_now_module.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background5),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        color: Color(AppColor.bgBlack),
      ),
      child: context.layout(
        mobile: const MobileContactView(),
        tablet: const RestrictView(withBg: false),
        web: const WebContactView(),
      ),
    );
  }
}

class WebContactView extends StatelessWidget {
  const WebContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderFill(space: 8),
        Expanded(child: WebScheduleNowModule()),
        Expanded(child: BeInTouchModule()),
        Footer(),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(16),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Text.rich(
            TextSpan(children: [
              const TextSpan(text: 'Designed by '),
              TextSpan(
                text: 'Babita Sharma',
                style: const TextStyle()
                    .copyWith(color: const Color(AppColor.bgYellow)),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrlString(
                        'https://www.behance.net/babitasharma5',
                        mode: LaunchMode.externalApplication,
                      ),
              ),
            ]),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ]),
        const Gap(12),
        Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  const TextSpan(text: 'Made with '),
                  WidgetSpan(
                    child: SizedBox.square(
                      dimension: 12,
                      child: Image.asset(ImageAssets.love),
                    ),
                  ),
                  const TextSpan(text: '  | Powered by '),
                  WidgetSpan(
                    child: InkWell(
                      onTap: () => launchUrlString(
                        'https://flutter.dev',
                        mode: LaunchMode.externalApplication,
                      ),
                      child: const SizedBox.square(
                        dimension: 12,
                        child: FlutterLogo(),
                      ),
                    ),
                  )
                ]),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ]),
        const Gap(16),
      ],
    );
  }
}
