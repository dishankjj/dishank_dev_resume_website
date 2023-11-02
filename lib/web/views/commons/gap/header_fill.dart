import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:flutter/widgets.dart';

class HeaderFill extends StatelessWidget {
  final double spacer;
  const HeaderFill({
    this.spacer = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacer +
          ((AppGlobalKey.headerKey.currentContext?.findRenderObject()
                      as RenderBox?)
                  ?.size
                  .height ??
              0),
    );
  }
}
