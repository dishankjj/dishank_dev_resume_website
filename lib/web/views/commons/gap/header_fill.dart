import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class HeaderFill extends StatelessWidget {
  const HeaderFill({this.space = 0, super.key});
  final double space;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height:
          space +
          ((AppGlobalKey.headerKey.currentContext?.findRenderObject()
                      as RenderBox?)
                  ?.size
                  .height ??
              0),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('space', space));
  }
}
