import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:flutter/material.dart';

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
