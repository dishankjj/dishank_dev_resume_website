import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/home/hollow_container_painter.dart';
import 'package:flutter/material.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final circleSize = size.width * 0.5;
    final circleStroke = size.width * 0.03;
    final innerCardHeight = size.height * 0.84;

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
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: circleStroke * 0.5),
                  child: SizedBox.square(
                    dimension: circleSize,
                    child: Image.asset(WebImageAssets.dpWithYellowRing),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(circleStroke * 2)
                    .add(const EdgeInsets.only(left: 8, top: 4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      AppText.hometext1,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(shadows: [
                        const Shadow(
                          blurRadius: 16,
                        ),
                      ]),
                    ),
                    const Gap(24),
                    Text(
                      AppText.hometext2,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(shadows: [
                        const Shadow(
                          blurRadius: 16,
                        ),
                      ]),
                    ),
                    const Gap(24),
                    Text(
                      AppText.hometext3,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(shadows: [
                        const Shadow(
                          blurRadius: 16,
                        ),
                      ]),
                    ),
                    const Gap(24),
                    Text(
                      AppText.hometext4,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(shadows: [
                        const Shadow(
                          blurRadius: 16,
                        ),
                      ]),
                    ),
                    const Spacer(),
                    Gap(circleSize)
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
