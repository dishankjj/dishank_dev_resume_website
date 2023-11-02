import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:flutter/widgets.dart';

class HollowContainer extends CustomPainter {
  final Layout layout;
  final double circleSize;
  final double stroke;
  final double circular;

  const HollowContainer({
    required this.layout,
    required this.circleSize,
    required this.stroke,
    required this.circular,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color(AppColor.bgYellow);
    paint.strokeWidth = stroke;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;

    final Rect adaptiveLayoutHolloWRect = switch (layout) {
      Layout.mobile => Rect.fromLTWH(
          stroke, 0, size.width - (stroke * 2), size.height - circleSize * 0.5),
      _ =>
        Rect.fromLTWH(0, 0, size.width - (circleSize * 0.4), size.height - 12),
    };

    final RRect hollowRRect = switch (layout) {
      Layout.mobile => RRect.fromRectAndCorners(
          adaptiveLayoutHolloWRect,
          topLeft: Radius.circular(circular),
          bottomLeft: const Radius.circular(8),
          topRight: Radius.circular(circular),
          bottomRight: Radius.circular(circular),
        ),
      _ => RRect.fromRectAndCorners(
          adaptiveLayoutHolloWRect,
          topLeft: Radius.circular(circular),
          bottomLeft: Radius.circular(circular),
          topRight: Radius.circular(circular),
          bottomRight: Radius.circular(circular),
        )
    };

    canvas.drawRRect(hollowRRect, paint);

    // final Offset adaptiveLayoutCircleAvatar = switch (layout) {
    //   Layout.mobile => Offset((circleSize / 2) + stroke, size.height),
    //   _ => Offset((circleSize / 2) + stroke, size.height),
    // };

    // canvas.drawCircle(adaptiveLayoutCircleAvatar, (circleSize / 2), paint);
  }

  @override
  bool shouldRepaint(HollowContainer oldDelegate) {
    return true;
  }
}
