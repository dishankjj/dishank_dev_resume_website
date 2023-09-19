import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show Image;

class WebHomeView extends StatelessWidget {
  const WebHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(WebImageAssets.homeBg),
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
      ),
      child: const HomeMainViewModule(),
    );
  }
}

class HomeMainViewModule extends StatelessWidget {
  const HomeMainViewModule({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(children: [
      Align(
        alignment: const Alignment(0, 0.5),
        child: FutureBuilder<ui.Image>(
            future: rootBundle
                .load(WebImageAssets.dpWithYellowRing)
                .then<ui.Image>(
                    (bytes) => decodeImageFromList(bytes.buffer.asUint8List())),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return CustomPaint(
                    painter: HollowContainer(
                        circleSize: size.height * 0.45, stroke: 24),
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
                                    image: AssetImage(
                                        WebImageAssets.dpWithYellowRing),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                    vertical: 8 * 8, horizontal: 8 * 8)
                                .copyWith(right: size.height * 0.55),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                  );
                default:
                  return const SizedBox();
              }
            }),
      ),
    ]);
  }
}

class HollowContainer extends CustomPainter {
  final double circleSize;
  final double stroke;

  const HollowContainer({
    required this.circleSize,
    required this.stroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(WebColorAsset.bgYellow);
    paint.strokeWidth = stroke;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;

    final RRect rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width - (circleSize * 0.4), size.height - 12),
      topLeft: Radius.circular(stroke),
      bottomLeft: Radius.circular(stroke),
      topRight: Radius.circular(stroke),
      bottomRight: Radius.circular(stroke),
    );

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(HollowContainer oldDelegate) {
    return true;
  }
}
