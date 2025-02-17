import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageDotVariant extends StatelessWidget {
  const PageDotVariant.horizontal(
    this.pageController, {
    required this.totalPages,
    super.key,
  }) : axis = Axis.horizontal;

  const PageDotVariant.vertical(
    this.pageController, {
    this.totalPages = 3,
    super.key,
  }) : axis = Axis.vertical;

  final PageController pageController;
  final int totalPages;
  final Axis axis;

  @override
  Widget build(final BuildContext context) {
    final double spacing = switch (axis) {
      Axis.horizontal => 6,
      Axis.vertical => 4,
    };

    return Wrap(
      spacing: spacing,
      direction: axis,
      children: List<Widget>.generate(
        totalPages,
        (final int index) => InkWell(
          onTap:
              () => unawaited(
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                ),
              ),
          child: SizedBox.square(
            dimension: 12,
            child: ListenableBuilder(
              listenable: pageController,
              builder: (final BuildContext context, _) {
                return Material(
                  color:
                      (pageController.page?.round() ?? 0) == index
                          ? const Color(AppColor.bgYellow)
                          : Colors.transparent,
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<PageController>('pageController', pageController),
      )
      ..add(IntProperty('totalPages', totalPages))
      ..add(EnumProperty<Axis>('axis', axis));
  }
}
