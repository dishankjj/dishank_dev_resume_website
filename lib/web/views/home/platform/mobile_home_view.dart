import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/home/hollow_container_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_border/flutter_animate_border.dart';
import 'package:gap/gap.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final FlutterAnimateBorderController controller =
        FlutterAnimateBorderController();

    final double circleSize = size.width * 0.5;
    final double circleStroke = size.width * 0.03;
    final double innerCardHeight = size.height * 0.84;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.85,
        height: innerCardHeight,
        margin: const EdgeInsets.only(top: 100),
        child: CustomPaint(
          painter: HollowContainer(
            layout: Layout.mobile,
            circleSize: circleSize,
            stroke: circleStroke,
            circular: 40,
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox.square(
                  dimension: circleSize,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 12,
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
                            ..setLineThickness(4)
                            ..setLineWidth(80)
                            ..setLinePadding(40),
                      child: Image.network(ImageAssets.dp),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  circleStroke * 2,
                ).add(const EdgeInsets.only(left: 8, top: 4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      AppText.homeText1,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        shadows: <Shadow>[const Shadow(blurRadius: 16)],
                      ),
                    ),
                    const Gap(24),
                    Text(
                      AppText.homeText2,
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium?.copyWith(
                        shadows: <Shadow>[const Shadow(blurRadius: 16)],
                      ),
                    ),
                    const Gap(24),
                    Text(
                      AppText.homeText3,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        shadows: <Shadow>[const Shadow(blurRadius: 16)],
                      ),
                    ),
                    const Gap(24),
                    Text(
                      AppText.homeText4,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        shadows: <Shadow>[const Shadow(blurRadius: 16)],
                      ),
                    ),
                    const Spacer(),
                    Gap(circleSize),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
