import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebScheduleNowModule extends StatefulWidget {
  const WebScheduleNowModule({super.key});

  @override
  State<WebScheduleNowModule> createState() => _WebScheduleNowModuleState();
}

class _WebScheduleNowModuleState extends State<WebScheduleNowModule> {
  late final WidgetStatesController buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = WidgetStatesController();
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
              AppText.contacttext1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: const Color(AppColor.textBlack),
                  ),
            ),
            const Gap.w(60),
            ListenableBuilder(
                listenable: buttonState,
                builder: (context, _) {
                  return ElevatedButton(
                    statesController: buttonState,
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 36, vertical: 24)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 4, color: Color(AppColor.bgYellow)),
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.black),
                      overlayColor: const WidgetStatePropertyAll(
                          Color(AppColor.bgYellow)),
                    ),
                    onPressed: () => launchUrlString(
                      'https://topmate.io/dishankjindal',
                      mode: LaunchMode.externalApplication,
                    ),
                    child: Text(
                      'Schedule Now',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: buttonState.value.any((state) => [
                                    WidgetState.hovered,
                                    WidgetState.pressed
                                  ].any((element) => element == state))
                              ? const Color(AppColor.textBlack)
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

class MobileScheduleModule extends StatefulWidget {
  const MobileScheduleModule({super.key});

  @override
  State<MobileScheduleModule> createState() => _MobileScheduleModuleState();
}

class _MobileScheduleModuleState extends State<MobileScheduleModule> {
  late final WidgetStatesController buttonState;

  @override
  void initState() {
    super.initState();
    buttonState = WidgetStatesController();
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
        width: double.infinity,
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
              bgColor: const Color(AppColor.bgBlack),
              highlightColor: AppColor.bgYellow,
              borderColor: AppColor.bgYellow,
              borderRadius: 48,
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 24,
              ),
            ),
            const Gap.h(24),
          ],
        ),
      ),
    );
  }
}
