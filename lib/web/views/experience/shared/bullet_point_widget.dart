import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BulletPointWidget extends StatelessWidget {
  const BulletPointWidget({required this.text, super.key});
  final String text;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(Icons.star, color: Color(AppColor.bgYellow), size: 24),
        const Gap(24),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
