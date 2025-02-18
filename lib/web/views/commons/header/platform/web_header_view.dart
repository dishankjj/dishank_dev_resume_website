import 'dart:async';
import 'dart:math';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/text_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebHeaderView extends StatelessWidget {
  const WebHeaderView(
    this.pageController, {
    required this.menuItems,
    super.key,
  });
  final PageController pageController;
  final Map<String, VoidCallback> menuItems;

  @override
  Widget build(final BuildContext context) {
    final FlutterAnimateBorderController controller =
        FlutterAnimateBorderController();
    final Size size = MediaQuery.sizeOf(context);

    return Material(
      type: MaterialType.transparency,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: max(100, size.height * 0.15),
        ),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(AppColor.bgBlack),
          border: Border.all(color: const Color(AppColor.bgYellow), width: 2),
        ),
        child: Row(
          children: <Widget>[
            const Image(image: NetworkImage(ImageAssets.logo)),
            const Spacer(),
            ListenableBuilder(
              listenable: pageController,
              builder: (final BuildContext context, _) {
                return Row(
                  children: <Widget>[
                    ...List<Widget>.generate(menuItems.length, (
                      final int index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ListenableBuilder(
                          listenable: pageController,
                          builder: (final BuildContext context, _) {
                            return AppTextButton(
                              isSelected:
                                  (pageController.page?.round() ?? 0) == index,
                              label: menuItems.keys.toList()[index],
                              labelStyle:
                                  Theme.of(context).textTheme.titleLarge,
                              textHighlightColor: AppColor.bgYellow,
                              callback: menuItems.values.toList()[index],
                            );
                          },
                        ),
                      );
                    }),
                    MouseRegion(
                      onEnter: (_) {
                        if (!controller.isRunning) {
                          controller.setRunning(true);
                        }
                      },
                      onExit: (_) {
                        if (controller.isRunning) {
                          controller.setRunning(false);
                        }
                      },
                      child: IntrinsicHeight(
                        child: FlutterAnimateBorder(
                          controller:
                              controller
                                ..setGradient(
                                  const LinearGradient(
                                    colors: <Color>[
                                      Color(AppColor.bgOrange),
                                      Color(AppColor.bgOrange),
                                    ],
                                  ),
                                )
                                ..setRunning(false)
                                ..setCornerRadius(48)
                                ..setLineThickness(4)
                                ..setLineWidth(24)
                                ..setLinePadding(-20),
                          child: AppCircleButton(
                            label: AppText.linkedin,
                            labelStyle: Theme.of(context).textTheme.titleLarge,
                            callback:
                                () => unawaited(
                                  launchUrlString(
                                    AppUrl.linkedin,
                                    mode: LaunchMode.externalApplication,
                                  ),
                                ),
                            highlightColor: AppColor.bgYellow,
                            borderColor: AppColor.bgYellow,
                            borderRadius: 48,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<PageController>('pageController', pageController),
      )
      ..add(
        DiagnosticsProperty<Map<String, VoidCallback>>('menuItems', menuItems),
      );
  }
}
