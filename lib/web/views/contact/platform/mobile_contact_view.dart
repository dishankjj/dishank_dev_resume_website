import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/contact/shared/be_in_touch_module.dart';
import 'package:dishank_dev_resume_website/web/views/contact/shared/footer_module.dart';
import 'package:dishank_dev_resume_website/web/views/contact/shared/schedule_now_module.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MobileContactView extends StatelessWidget {
  const MobileContactView({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Column(
      children: <Widget>[
        HeaderFill(space: 32),
        MobileScheduleModule(),
        Gap(48),
        BeInTouchModule(),
        Spacer(),
        Footer(),
      ],
    );
  }
}
