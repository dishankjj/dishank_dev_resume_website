import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScheduleNowWebView extends StatefulWidget {
  const ScheduleNowWebView({super.key});

  @override
  State<ScheduleNowWebView> createState() => _ScheduleNowWebViewState();
}

class _ScheduleNowWebViewState extends State<ScheduleNowWebView> {
  late final MaterialStatesController buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = MaterialStatesController();
  }

  @override
  void dispose() {
    buttonState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Align(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(AppColor.bgWhite),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(size.width * 0.015),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap.w(24),
            Text(
              'Interested in working together? Let’s plan a conversation',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(AppColor.bgBlack),
                  ),
            ),
            const Gap.w(48 * 2),
            ListenableBuilder(
                listenable: buttonState,
                builder: (context, _) {
                  return ElevatedButton(
                    statesController: buttonState,
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 36, vertical: 24)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: Color(AppColor.bgYellow)),
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      overlayColor: const MaterialStatePropertyAll(
                          Color(AppColor.bgYellow)),
                    ),
                    onPressed: () => launchUrlString(
                      'https://topmate.io/dishankjindal',
                      mode: LaunchMode.externalApplication,
                    ),
                    child: Text(
                      'Schedule Now',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: buttonState.value.any((state) => [
                                        MaterialState.hovered,
                                        MaterialState.pressed
                                      ].any((element) => element == state))
                                  ? const Color(AppColor.bgBlack)
                                  : null),
                    ),
                  );
                }),
            const Gap.w(24),
          ],
        ),
      ),
    );
  }
}

class ScheduleNowMobileView extends StatefulWidget {
  const ScheduleNowMobileView({super.key});

  @override
  State<ScheduleNowMobileView> createState() => _ScheduleNowMobileViewState();
}

class _ScheduleNowMobileViewState extends State<ScheduleNowMobileView> {
  late final MaterialStatesController buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = MaterialStatesController();
  }

  @override
  void dispose() {
    buttonState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Align(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(AppColor.bgWhite),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(size.width * 0.015),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap.h(24),
            Text(
              AppText.contacttext1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: const Color(AppColor.bgBlack),
                  ),
            ),
            const Gap.h(24),
            AppCircleButton(
              label: AppText.contacttext2,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              callback: () => launchUrlString(
                AppUrl.topmate,
                mode: LaunchMode.externalApplication,
              ),
              bgColor: AppColor.bgBlack,
              highlightColor: AppColor.bgYellow,
              borderColor: AppColor.bgYellow,
              borderRadius: 48,
              
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            ),
            const Gap.h(24),
          ],
        ),
      ),
    );
  }
}
