import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/app/views/commons/extensions/box.dart';
import 'package:dishank_dev_resume_website/app/views/commons/extensions/padding.dart';
import 'package:dishank_dev_resume_website/app/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';

class BeInTouchModule extends StatelessWidget {
  const BeInTouchModule({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Be in touch with',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Gap(48),
        Wrap(
          spacing: 48 * 2,
          runSpacing: 48,
          children: [
            const Image(
              image: AssetImage(WebImageAssets.discord),
              fit: BoxFit.contain,
            ).size(82),
            const Image(
              image: AssetImage(WebImageAssets.github),
              fit: BoxFit.contain,
            ).size(82),
            const Image(
              image: AssetImage(WebImageAssets.gmail),
              fit: BoxFit.contain,
            ).size(82),
            const Image(
              image: AssetImage(WebImageAssets.insta),
              fit: BoxFit.contain,
            ).size(82),
            const Image(
              image: AssetImage(WebImageAssets.linkedin),
              fit: BoxFit.contain,
            ).size(82),
            const Image(
              image: AssetImage(WebImageAssets.x),
              fit: BoxFit.contain,
            ).size(82),
          ],
        ).padding(
          EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
          ),
        ),
      ],
    );
  }
}
