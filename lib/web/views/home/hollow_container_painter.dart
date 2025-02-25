import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/enums.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:flutter/widgets.dart';

class HollowContainer extends CustomPainter {
  const HollowContainer({
    required this.layout,
    required this.circleSize,
    required this.stroke,
    required this.circular,
    this.animate = 1.0,
  });

  final Layout layout;
  final double circleSize;
  final double stroke;
  final double circular;
  final double animate;

  @override
  void paint(final Canvas canvas, final Size size) => switch (layout) {
    Layout.mobile => paintOnMobile(canvas, size),
    _ => paintOnWeb(canvas, size),
  };

  void paintOnWeb(final Canvas canvas, final Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(AppColor.bgYellow)
          ..strokeWidth = stroke
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromLTWH(
      0,
      0,
      size.width - (circleSize * 0.4),
      size.height - 12,
    );

    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(circular),
    );

    final Path path = Path()..addRRect(rrect);

    if (animate > 0) {
      canvas.drawPath(
        path.computeMetrics().first.extractPath(
          0,
          path.computeMetrics().first.length * animate,
        ),
        paint,
      );
    }
    if (animate == 1) {
      AppGlobalKey.initialBoot = true;
    }
  }

  void paintOnMobile(final Canvas canvas, final Size size) {
    final Paint paint =
        Paint()
          ..color = const Color(AppColor.bgYellow)
          ..strokeWidth = stroke
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromLTWH(
      stroke,
      0,
      size.width - (stroke * 2),
      size.height - circleSize * 0.5,
    );

    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(circular),
    );

    final Path path = Path()..addRRect(rrect);

    if (animate > 0) {
      canvas.drawPath(
        path.computeMetrics().first.extractPath(
          0,
          path.computeMetrics().first.length * animate,
        ),
        paint,
      );
    }
    if (animate == 1) {
      AppGlobalKey.initialBoot = true;
    }
  }

  @override
  bool shouldRepaint(final HollowContainer oldDelegate) {
    return true;
  }
}
