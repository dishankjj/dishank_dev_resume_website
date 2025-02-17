import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  const DropDownMenuWidget(
    this.pageController, {
    required this.headerMenuItems,
    required this.menuButtonCtrl,
    super.key,
  });
  final PageController pageController;
  final Map<String, VoidCallback> headerMenuItems;
  final OverlayPortalController menuButtonCtrl;

  @override
  Widget build(final BuildContext context) {
    final List<String> items = <String>[];
    final List<VoidCallback> callbacks = <VoidCallback>[];
    final int totalCount = headerMenuItems.entries.length;
    for (final MapEntry<String, VoidCallback> element
        in headerMenuItems.entries) {
      items.add(element.key);
      callbacks.add(element.value);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int index = 0; index < totalCount; index++)
            TextButton(
              onPressed: () {
                callbacks[index]();
                menuButtonCtrl.hide();
              },
              child: ListenableBuilder(
                listenable: pageController,
                builder: (final BuildContext context, _) {
                  return Text(
                    items[index],
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color:
                          (pageController.page?.round() ?? 0) == index
                              ? const Color(AppColor.bgYellow)
                              : null,
                    ),
                  );
                },
              ),
            ),
        ],
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
      ..add(
        DiagnosticsProperty<Map<String, VoidCallback>>(
          'headerMenuItems',
          headerMenuItems,
        ),
      )
      ..add(
        DiagnosticsProperty<OverlayPortalController>(
          'menuButtonCtrl',
          menuButtonCtrl,
        ),
      );
  }
}
