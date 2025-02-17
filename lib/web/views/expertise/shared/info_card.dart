import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard.light({required this.label, super.key})
    : color = AppColor.bgWhite,
      textColor = AppColor.textBlack;

  const InfoCard.dark({required this.label, super.key})
    : color = AppColor.bgBlack,
      textColor = AppColor.textWhite;

  final String label;
  final int color;
  final int textColor;

  @override
  Widget build(final BuildContext context) {
    return Card(
      color: Color(color),
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Color(AppColor.bgYellow)),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Align(
        child: Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: Color(textColor)),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(IntProperty('color', color))
      ..add(IntProperty('textColor', textColor));
  }
}
