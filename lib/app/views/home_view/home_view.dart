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
        alignment: const Alignment(-0.5, 0.5),
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
                      img: snapshot.data!,
                      imageSize: 400,
                      stroke: 24,
                    ),
                    child: Container(
                      width: size.width * 0.65,
                      height: size.height * 0.65,
                      padding: const EdgeInsets.symmetric(
                              vertical: 8 * 8, horizontal: 8 * 8)
                          .copyWith(right: 8 * 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi there :)',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'I\'m Dishank Jindal',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            'Mobile Software Engineer\nBring your ideas to life with me',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'I am a passionate and skilled Mobile Engineer with expertise in Flutter, dedicated to crafting seamless and user-centric digital experiences. Proficient in both Android and iOS frameworks, I thrive on transforming ideas into fully functional and visually stunning applications.',
                            style: Theme.of(context).textTheme.bodyMedium,
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

class CircleHollowImageContainer extends CustomClipper<RRect> {
  final ui.Image img;
  final double imageSize;
  final double stroke;

  const CircleHollowImageContainer({
    required this.img,
    required this.imageSize,
    required this.stroke,
  });

  @override
  RRect getClip(Size size) {
    final radius = imageSize;
    final RRect rrectImage = RRect.fromRectAndRadius(
      Rect.fromLTWH(
          size.width - (radius * 0.6), size.height - radius, radius, radius),
      Radius.circular(radius),
    );

    return rrectImage;
  }

  @override
  bool shouldReclip(CircleHollowImageContainer oldClipper) {
    return true;
  }

  // @override
  // void paint(Canvas canvas, Size size) {
  //   final paint = Paint();
  //   paint.color = const Color(WebColorAsset.bgYellow);
  //   paint.strokeWidth = stroke;
  //   paint.style = PaintingStyle.stroke;
  //   paint.strokeCap = StrokeCap.round;

  //   // final RRect rrect = RRect.fromRectAndCorners(
  //   //   Rect.fromLTWH(0, 0, size.width, size.height),
  //   //   topLeft: Radius.circular(stroke),
  //   //   bottomLeft: Radius.circular(stroke),
  //   //   topRight: Radius.circular(stroke),
  //   //   bottomRight: Radius.circular(stroke),
  //   // );

  //   // canvas.drawRRect(rrect, paint);

  //   final radius = imageSize;
  //   final RRect rrectImage = RRect.fromRectAndRadius(
  //     Rect.fromLTWH(
  //         size.width - (radius * 0.6), size.height - radius, radius, radius),
  //     Radius.circular(radius),
  //   );

  //   canvas.drawImage(
  //     img,
  //     Offset(size.width - (img.width * 0.55), size.height - (img.height - 12)),
  //     paint,
  //   );

  //   canvas.drawRRect(rrectImage, paint);
  //   canvas.clipRRect(rrectImage);
  // }

  // @override
  // bool shouldRepaint(HollowContainer oldDelegate) {
  //   return true;
  // }
}

class HollowContainer extends CustomPainter {
  final ui.Image img;
  final double imageSize;
  final double stroke;

  const HollowContainer({
    required this.img,
    required this.imageSize,
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
      Rect.fromLTWH(0, 0, size.width, size.height),
      topLeft: Radius.circular(stroke),
      bottomLeft: Radius.circular(stroke),
      topRight: Radius.circular(stroke),
      bottomRight: Radius.circular(stroke),
    );

    canvas.drawRRect(rrect, paint);

    // final radius = imageSize;
    // final RRect rrectImage = RRect.fromRectAndRadius(
    //   Rect.fromLTWH(
    //       size.width - (radius * 0.6), size.height - radius, radius, radius),
    //   Radius.circular(radius),
    // );

    canvas.drawImage(
      img,
      Offset(size.width - (img.width * 0.55), size.height - (img.height - 12)),
      paint,
    );

    // canvas.drawRRect(rrectImage, paint);
  }

  @override
  bool shouldRepaint(HollowContainer oldDelegate) {
    return true;
  }
}
