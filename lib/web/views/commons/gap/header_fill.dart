import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:flutter/widgets.dart';

class HeaderFill extends StatelessWidget {
  final double space;
  const HeaderFill({
    this.space = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space +
          ((AppGlobalKey.headerKey.currentContext?.findRenderObject()
                      as RenderBox?)
                  ?.size
                  .height ??
              0),
    );
  }
}
