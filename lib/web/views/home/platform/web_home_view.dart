import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/home/hollow_container_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:gap/gap.dart';

class WebHomeView extends StatelessWidget {
  const WebHomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final FlutterAnimateBorderController controller =
        FlutterAnimateBorderController();
    return Stack(
      children: <Widget>[
        Align(
          alignment: const Alignment(0, 0.5),
          child: CustomPaint(
            painter: HollowContainer(
              layout: Layout.web,
              circleSize: size.height * 0.45,
              stroke: 24,
              circular: 24,
            ),
            child: SizedBox(
              width: size.width * 0.80,
              height: size.height * 0.70,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox.square(
                      dimension: size.height * 0.45,

                      ///! when swapping the below code between container and decoratedBox widget border radius is not working, but analyser is suggesting to change to decoratedBox which is a wrong suggestion or the decoratedBox Code is buggy
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 24,
                            color: const Color(AppColor.bgYellow),
                          ),
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: FlutterAnimateBorder(
                          controller:
                              controller
                                ..setGradient(
                                  const SweepGradient(
                                    colors: <Color>[
                                      Colors.black,
                                      Colors.blue,
                                      Color(AppColor.bgYellow),
                                      Colors.green,
                                      Colors.red,
                                    ],
                                  ),
                                )
                                ..setCornerRadius(1000)
                                ..setLineThickness(8)
                                ..setLineWidth(100)
                                ..setLinePadding(80),
                          child: Image.network(ImageAssets.dp),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 48,
                      horizontal: 64,
                    ).copyWith(right: size.height * 0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          AppText.homeText1,
                          style: Theme.of(
                            context,
                          ).textTheme.displayMedium?.copyWith(
                            shadows: <Shadow>[
                              const Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const Gap(16),
                        Text(
                          AppText.homeText2,
                          style: Theme.of(
                            context,
                          ).textTheme.displayLarge?.copyWith(
                            shadows: <Shadow>[
                              const Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const Gap(24),
                        Text(
                          AppText.homeText3,
                          style: Theme.of(
                            context,
                          ).textTheme.displaySmall?.copyWith(
                            shadows: <Shadow>[
                              const Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const Gap(24),
                        Text(
                          AppText.homeText4,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium?.copyWith(
                            shadows: <Shadow>[
                              const Shadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
