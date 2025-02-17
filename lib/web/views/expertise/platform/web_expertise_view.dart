import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/expertise/shared/info_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:gap/gap.dart';

class WebExpertiseView extends StatelessWidget {
  const WebExpertiseView({super.key});

  List<String> get expertiseList => <String>[
    AppText.expertiseText1l,
    AppText.expertiseText1r,
    AppText.expertiseText2l,
    AppText.expertiseText2r,
    AppText.expertiseText3l,
    AppText.expertiseText3r,
    AppText.expertiseText4l,
    AppText.expertiseText4r,
    AppText.expertiseText5l,
    AppText.expertiseText5r,
  ];

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      children: <Widget>[
        const HeaderFill(space: 120),
        Align(
          child: Text(
            AppText.expertiseLabel,
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(height: 0.5),
          ),
        ),
        const Gap(24),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(48),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16,
              spacing: 16,
              children: List<Widget>.generate(expertiseList.length, (
                final int index,
              ) {
                if (index.isEven) {
                  return SizedBox(
                    width: size.width * 0.15,
                    height: 180,
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
                            ..setCornerRadius(18),
                      child: InfoCard.dark(label: expertiseList[index]),
                    ),
                  );
                } else {
                  return SizedBox(
                    width: size.width * 0.15,
                    height: 180,
                    child: AspectRatio(
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
