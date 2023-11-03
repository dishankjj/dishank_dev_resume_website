import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String label;

  final int color;
  final int textColor;
  const InfoCard.light({required this.label, super.key})
      : color = AppColor.bgWhite,
        textColor = AppColor.textBlack;

  const InfoCard.dark({required this.label, super.key})
      : color = AppColor.bgBlack,
        textColor = AppColor.textWhite;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Card(
      color: Color(color),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: Color(AppColor.bgYellow),
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        width: size.width * 0.3,
        height: 80,
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(textColor),
              ),
        ),
      ),
    );
  }
}
