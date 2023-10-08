import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/app/views/commons/extensions/padding.dart';
import 'package:dishank_dev_resume_website/app/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/app/views/contact_view/be_in_touch_module.dart';
import 'package:dishank_dev_resume_website/app/views/contact_view/schedule_now_module.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(WebImageAssets.background5),
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
        color: Color(WebColorAsset.bgBlack),
      ),
      child: const ContactViewWebModule(),
    );
  }
}

class ContactViewWebModule extends StatelessWidget {
  const ContactViewWebModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: WebGlobalKey.headerKey.currentState != null
              ? (WebGlobalKey.headerKey.currentState!.context.findRenderObject()
                      as RenderBox)
                  .size
                  .height
              : 0,
        ),
        const Expanded(
          child: Column(children: [
            Expanded(child: ScheduleNowModule()),
            Gap(48),
            Expanded(child: BeInTouchModule()),
            Expanded(child: WebFooterModule())
          ]),
        ),
      ],
    );
  }
}

class WebFooterModule extends StatelessWidget {
  const WebFooterModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text.rich(
          TextSpan(children: [
            const TextSpan(text: 'Designed by '),
            TextSpan(
              text: 'Babita Sharma',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: const Color(WebColorAsset.bgYellow)),
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
    ).padding(const EdgeInsets.only(bottom: 24));
  }
}
