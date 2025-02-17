import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/contact/be_in_touch_module.dart';
import 'package:dishank_dev_resume_website/web/views/contact/platform/mobile_contact_view.dart';
import 'package:dishank_dev_resume_website/web/views/contact/schedule_now_module.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background5),
          fit: BoxFit.cover,
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
  Widget build(final BuildContext context) {
    return const Column(
      children: <Widget>[
        HeaderFill(space: 8),
        Expanded(child: WebScheduleNowModule()),
        Expanded(child: BeInTouchModule()),
        Footer(),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Gap(16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  const TextSpan(text: 'Designed by '),
                  TextSpan(
                    text: 'Babita Sharma',
                    style: const TextStyle().copyWith(
                      color: const Color(AppColor.bgYellow),
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap =
                              () => unawaited(
                                launchUrlString(
                                  'https://www.behance.net/babitasharma5',
                                  mode: LaunchMode.externalApplication,
                                ),
                              ),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        const Gap(12),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
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
                      onTap:
                          () => unawaited(
                            launchUrlString(
                              'https://flutter.dev',
                              mode: LaunchMode.externalApplication,
                            ),
                          ),
                      child: const SizedBox.square(
                        dimension: 12,
                        child: FlutterLogo(),
                      ),
                    ),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        const Gap(16),
      ],
    );
  }
}
