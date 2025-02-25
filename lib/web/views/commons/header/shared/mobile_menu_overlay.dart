import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/global_keys.dart';
import 'package:flutter/material.dart';

class MobileMenuOverlay extends StatelessWidget {
  const MobileMenuOverlay({required this.child, super.key});
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final Size query = MediaQuery.sizeOf(context);
    final Size size = Size(query.width * 0.36, 0);

    final RenderBox? box = switch (AppGlobalKey.menuKey.currentContext) {
      != null =>
        AppGlobalKey.menuKey.currentContext?.findRenderObject() as RenderBox?,
      _ => null,
    };

    AppGlobalKey.menuKey.currentContext?.findRenderObject() as RenderBox?;
    final Offset pos =
        box?.localToGlobal(Offset(-size.width, 0)) ?? Offset.zero;

    return Positioned(
      top: pos.dy + ((box?.size.width ?? 1) / 2),
      left: pos.dx + ((box?.size.height ?? 1) / 2),
      child: Container(
        // height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: const Color(AppColor.menu),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          border: Border.all(color: const Color(AppColor.bgYellow)),
        ),
        child: child,
      ),
    );
  }
}
