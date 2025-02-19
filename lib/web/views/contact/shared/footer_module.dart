import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                  const TextSpan(text: AppText.designedBy),
                  TextSpan(
                    text: AppText.babitaSharma,
                    style: const TextStyle().copyWith(
                      color: const Color(AppColor.bgYellow),
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap =
                              () => unawaited(
                                launchUrlString(
                                  AppUrl.behance,
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
                  const TextSpan(text: AppText.madeWith),
                  WidgetSpan(
                    child: SizedBox.square(
                      dimension: 12,
                      child: Image.network(ImageAssets.love),
                    ),
                  ),
                  const TextSpan(text: AppText.poweredBy),
                  WidgetSpan(
                    child: InkWell(
                      onTap:
                          () => unawaited(
                            launchUrlString(
                              AppUrl.flutter,
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
