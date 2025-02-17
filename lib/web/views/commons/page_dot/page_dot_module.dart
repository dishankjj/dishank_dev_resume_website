import 'dart:async';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageDotModule extends StatefulWidget {
  const PageDotModule.horizontal(
    this.pageController, {
    required this.totalPages,
    super.key,
  }) : axis = Axis.horizontal;

  const PageDotModule.vertical(
    this.pageController, {
    this.totalPages = 3,
    super.key,
  }) : axis = Axis.vertical;

  final PageController pageController;
  final int totalPages;
  final Axis axis;

  @override
  State<PageDotModule> createState() => _PageDotModuleState();

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

class _PageDotModuleState extends State<PageDotModule> {
  late bool offStage;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    offStage = true;
    widget.pageController.addListener(resetTimer);
  }

  void resetTimer() {
    _timer?.cancel();
    _timer = null;

    if (offStage) {
      if (mounted) {
        setState(() {
          offStage = false;
        });
      }
    }

    _timer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          offStage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(final BuildContext context) {
    final double spacing = switch (widget.axis) {
      Axis.horizontal => 6,
      Axis.vertical => 4,
    };

    return Offstage(
      offstage: offStage,
      child: Wrap(
        spacing: spacing,
        direction: widget.axis,
        children: List<Widget>.generate(
          widget.totalPages,
          (final int index) => InkWell(
            onTap: () {
              unawaited(
                widget.pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                ),
              );
            },
            child: SizedBox.square(
              dimension: 12,
              child: ListenableBuilder(
                listenable: widget.pageController,
                builder: (final BuildContext context, _) {
                  return Transform.scale(
                    scale:
                        (widget.pageController.page?.round() ?? 0) == index
                            ? 1
                            : 0.6,
                    child: CircleAvatar(
                      backgroundColor:
                          (widget.pageController.page?.round() ?? 0) == index
                              ? const Color(AppColor.bgOrange)
                              : const Color(AppColor.bgWhite),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('offStage', offStage));
  }
}
