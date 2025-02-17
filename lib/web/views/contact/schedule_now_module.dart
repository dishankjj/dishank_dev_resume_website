import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

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
          children: <Widget>[
            const Gap(24),
            Text(
              AppText.contactText1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: const Color(AppColor.textBlack),
              ),
            ),
            const Gap(60),
            ListenableBuilder(
              listenable: buttonState,
              builder: (final BuildContext context, _) {
                return ElevatedButton(
                  statesController: buttonState,
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                    ),
                    shape: WidgetStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 4,
                          color: Color(AppColor.bgYellow),
                        ),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll<Color>(
                      Colors.black,
                    ),
                    overlayColor: const WidgetStatePropertyAll<Color>(
                      Color(AppColor.bgYellow),
                    ),
                  ),
                  onPressed:
                      () => unawaited(
                        launchUrlString(
                          'https://topmate.io/dishankjindal',
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                  child: Text(
                    'Schedule Now',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color:
                          buttonState.value.any(
                                (final WidgetState state) => <WidgetState>[
                                  WidgetState.hovered,
                                  WidgetState.pressed,
                                ].any(
                                  (final WidgetState element) =>
                                      element == state,
                                ),
                              )
                              ? const Color(AppColor.textBlack)
                              : null,
                    ),
                  ),
                );
              },
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStatesController>('buttonState', buttonState),
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
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

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
          children: <Widget>[
            const Gap(24),
            Text(
              AppText.contactText1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: const Color(AppColor.bgBlack),
              ),
            ),
            const Gap(24),
            AppCircleButton(
              label: AppText.contactText2,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              callback:
                  () => unawaited(
                    launchUrlString(
                      AppUrl.topMate,
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
              bgColor: const Color(AppColor.bgBlack),
              highlightColor: AppColor.bgYellow,
              borderColor: AppColor.bgYellow,
              borderRadius: 48,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<WidgetStatesController>('buttonState', buttonState),
    );
  }
}
