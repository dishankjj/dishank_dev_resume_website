import 'dart:math';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/circle_button.dart';
import 'package:dishank_dev_resume_website/web/views/commons/buttons/text_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebHeaderView extends StatelessWidget {
  final PageController pageController;
  final Map<String, VoidCallback> menuItems;

  const WebHeaderView(
    this.pageController, {
    required this.menuItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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
          border: Border.all(
            color: const Color(AppColor.bgYellow),
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Image(image: AssetImage(ImageAssets.logo)),
          const Spacer(),
          ListenableBuilder(
            listenable: pageController,
            builder: (context, _) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(menuItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ListenableBuilder(
                          listenable: pageController,
                          builder: (context, _) {
                            return AppTextButton(
                              isSelected:
                                  (pageController.page?.round() ?? 0) == index,
                              label: menuItems.keys.toList()[index],
                              labelStyle:
                                  Theme.of(context).textTheme.titleLarge,
                              textHighlightColor: AppColor.bgYellow,
                              callback: menuItems.values.toList()[index],
                            );
                          }),
                    );
                  }),
                  AppCircleButton(
                    label: AppText.pingMe,
                    labelStyle: Theme.of(context).textTheme.titleLarge,
                    callback: () => launchUrlString(
                      AppUrl.linkedin,
                      mode: LaunchMode.externalApplication,
                    ),
                    highlightColor: AppColor.bgYellow,
                    borderColor: AppColor.bgYellow,
                    borderRadius: 48,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 24),
                  )
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}
