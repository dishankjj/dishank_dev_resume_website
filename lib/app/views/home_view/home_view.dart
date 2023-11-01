import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/enums.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/app/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/app/views/home_view/hollow_container_painter.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(WebImageAssets.background1),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
        ),
        color: Color(WebColorAsset.bgBlack),
      ),
      child: context.layout(
        mobile: const HomeViewMobileView(),
        tablet: const SizedBox(),
        web: const HomeViewWebModule(),
      ),
    );
  }
}

class HomeViewMobileView extends StatelessWidget {
  const HomeViewMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final circleSize = size.width * 0.5;
    final circleStroke = size.width * 0.03;
    final innerCardHeight = size.height * 0.82;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.85,
        height: innerCardHeight,
        margin: const EdgeInsets.only(top: 88),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi there :)',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(shadows: [
                        const Shadow(
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
                          blurRadius: 4,
                        ),
                      ]),
                    ),
                    const Gap.h(24),
                    Text(
                      'Mobile Software Engineer\nBring your ideas to life with me',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(shadows: [
                        const Shadow(
                          blurRadius: 4,
                        ),
                      ]),
                    ),
                    const Gap.h(24),
                    Text(
                      'I am a passionate and skilled Mobile Engineer with expertise in Flutter, dedicated to crafting seamless and user-centric digital experiences. Proficient in both Android and iOS frameworks, I thrive on transforming ideas into fully functional and visually stunning applications.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(shadows: [
                        const Shadow(
                          blurRadius: 16,
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
    );
  }
}

class HomeViewTabletView extends StatelessWidget {
  const HomeViewTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomeViewWebModule extends StatelessWidget {
  const HomeViewWebModule({super.key});

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
                          image: AssetImage(WebImageAssets.dpWithYellowRing),
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
                            .titleLarge
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
                            .titleMedium
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
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
