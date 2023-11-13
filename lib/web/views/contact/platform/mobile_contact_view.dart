import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/contact/be_in_touch_module.dart';
import 'package:dishank_dev_resume_website/web/views/contact/contact_view.dart';
import 'package:dishank_dev_resume_website/web/views/contact/schedule_now_module.dart';
import 'package:flutter/material.dart';

class MobileContactView extends StatelessWidget {
  const MobileContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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
