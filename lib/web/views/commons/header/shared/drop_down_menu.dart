import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  final PageController pageController;
  final Map<String, VoidCallback> headerMenuItems;
  final OverlayPortalController menuButtonCtrl;

  const DropDownMenuWidget(
    this.pageController, {
    required this.headerMenuItems,
    required this.menuButtonCtrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = [];
    final List<VoidCallback> callbacks = [];
    final int totalCount = headerMenuItems.entries.length;
    for (var element in headerMenuItems.entries) {
      items.add(element.key);
      callbacks.add(element.value);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var index = 0; index < totalCount; index++)
            TextButton(
              onPressed: () {
                callbacks[index]();
                menuButtonCtrl.hide();
              },
              child: ListenableBuilder(
                listenable: pageController,
                builder: (context, _) {
                  return Text(
                    items[index],
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: (pageController.page?.round() ?? 0) == index
                            ? const Color(AppColor.bgYellow)
                            : null),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
