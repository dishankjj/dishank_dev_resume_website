import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/home/hollow_container_painter.dart';
import 'package:flutter/material.dart';

class WebHomeView extends StatelessWidget {
  const WebHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(children: [
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
            height: size.height * 0.60,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox.square(
                    dimension: size.height * 0.45,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.dpWithYellowRing),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 48, horizontal: 64)
                          .copyWith(right: size.height * 0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hi there :)',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(shadows: [
                          const Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ]),
                      ),
                      const Gap.h(16),
                      Text(
                        'I\'m Dishank Jindal',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(shadows: [
                          const Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ]),
                      ),
                      const Gap.h(24),
                      Text(
                        'Mobile Software Engineer\nBring your ideas to life with me',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(shadows: [
                          const Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ]),
                      ),
                      const Gap.h(24),
                      Text(
                        'I am a passionate and skilled Mobile Engineer with expertise in Flutter, dedicated to crafting seamless and user-centric digital experiences. Proficient in both Android and iOS frameworks, I thrive on transforming ideas into fully functional and visually stunning applications.',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(shadows: [
                          const Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
