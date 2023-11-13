import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/web/views/commons/extensions/box.dart';
import 'package:dishank_dev_resume_website/web/views/commons/extensions/padding.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BeInTouchModule extends StatelessWidget {
  const BeInTouchModule({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final double iconSize = context.layout<double>(
      mobile: 48,
      tablet: 48,
      web: 60,
    );

    final double iconSpacing = context.layout<double>(
      mobile: 36,
      tablet: 36,
      web: 48,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppText.contacttext3,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const Gap(24),
        Wrap(
          spacing: iconSpacing,
          runSpacing: iconSpacing,
          children: [
            // const Image(
            //   image: AssetImage(WebImageAssets.discord),
            //   fit: BoxFit.contain,
            // ).size(iconSize),
            // const Image(
            //   image: AssetImage(WebImageAssets.github),
            //   fit: BoxFit.contain,
            // ).size(iconSize),
            InkWell(
              onTap: () => launchUrlString(
                AppUrl.email,
                mode: LaunchMode.externalApplication,
              ),
              child: const Image(
                image: AssetImage(ImageAssets.gmail),
                fit: BoxFit.contain,
              ).size(iconSize),
            ),

            // const Image(
            //   image: AssetImage(WebImageAssets.insta),
            //   fit: BoxFit.contain,
            // ).size(iconSize),
            InkWell(
              onTap: () => launchUrlString(
                AppUrl.linkedin,
                mode: LaunchMode.externalApplication,
              ),
              child: const Image(
                image: AssetImage(ImageAssets.linkedin),
                fit: BoxFit.contain,
              ).size(iconSize),
            ),
            InkWell(
              onTap: () => launchUrlString(
                AppUrl.x,
                mode: LaunchMode.externalApplication,
              ),
              child: const Image(
                image: AssetImage(ImageAssets.x),
                fit: BoxFit.contain,
              ).size(iconSize),
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: size.width * 0.1)),
      ],
    );
  }
}
