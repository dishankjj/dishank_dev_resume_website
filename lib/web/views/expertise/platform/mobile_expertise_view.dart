import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:gap/gap.dart';

class MobileExpertiseView extends StatelessWidget {
  const MobileExpertiseView(this.expertiseList, {super.key});

  final List<String> expertiseList;

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: <Widget>[
        const HeaderFill(space: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppText.expertiseLabel,
                  style: Theme.of(
                    context,
                  ).textTheme.displayMedium?.copyWith(height: 0.5),
                ),
              ),
              const Gap(8),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: size.width * 0.5,
                  height: 1,
                  margin: const EdgeInsets.only(right: 24),
                  color: const Color(AppColor.bgYellow),
                ),
              ),
              const Gap(4),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: size.width * 0.5,
                  height: 1,
                  margin: const EdgeInsets.only(right: 48),
                  color: const Color(AppColor.bgYellow),
                ),
              ),
            ],
          ),
        ),
        const Gap(16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: GridView(
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2,
              ),
              children: List<Widget>.generate(expertiseList.length, (
                final int index,
              ) {
                if (index.isEven) {
                  return FlutterAnimateBorder(
                    controller:
                        FlutterAnimateBorderController()
                          ..setGradient(
                            const RadialGradient(
                              radius: 1,
                              colors: <Color>[
                                Color(AppColor.bgYellow),
                                Colors.transparent,
                              ],
                            ),
                          )
                          ..setLineThickness(2)
                          ..setLineWidth(48)
                          ..setCornerRadius(18),
                    child: InfoCard.dark(label: expertiseList[index]),
                  );
                } else {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: FlutterAnimateBorder(
                      controller:
                          FlutterAnimateBorderController()
                            ..setGradient(
                              const RadialGradient(
                                radius: 1,
                                colors: <Color>[
                                  Color(AppColor.bgYellow),
                                  Colors.transparent,
                                ],
                              ),
                            )
                            ..setLineThickness(2)
                            ..setLineWidth(48)
                            ..setLinePadding(0)
                            ..setCornerRadius(18),
                      child: InfoCard.light(label: expertiseList[index]),
                    ),
                  );
                }
              }),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('expertiseList', expertiseList));
  }
}
