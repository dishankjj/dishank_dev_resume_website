import 'dart:math';

import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/ui_extensions.dart';
import 'package:dishank_dev_resume_website/app/views/commons/buttons/buttton_highlight_on_hover.dart';
import 'package:dishank_dev_resume_website/app/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeaderView extends StatefulWidget {
  final PageController pageController;

  const HeaderView(
    this.pageController, {
    super.key,
  });

  @override
  State<HeaderView> createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  late final Map<String, VoidCallback?> headerMenuItems = {
    'Home': () => widget.pageController.jumpToPage(0),
    'Expertise': () => widget.pageController.jumpToPage(1),
    'Experience': () => widget.pageController.jumpToPage(2),
    'Certification': () => widget.pageController.jumpToPage(3),
    'Contact': () => widget.pageController.jumpToPage(4),
    'Ping Me': null,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(WebColorAsset.bgBlack),
      ),
      child: context.layout(
        mobile: MobileHeaderView(
          widget.pageController,
          menuItems: headerMenuItems,
        ),
        tablet: const SizedBox(),
        web: WebHeaderView(
          widget.pageController,
          menuItems: headerMenuItems,
        ),
      ),
    );
  }
}

class MobileHeaderView extends StatefulWidget {
  final PageController pageController;
  final Map<String, VoidCallback?> menuItems;

  const MobileHeaderView(
    this.pageController, {
    required this.menuItems,
    super.key,
  });

  @override
  State<MobileHeaderView> createState() => _MobileHeaderViewState();
}

class _MobileHeaderViewState extends State<MobileHeaderView> {
  late final MaterialStatesController buttonState;
  late final OverlayPortalController _overlayPortalController;
  late final GlobalKey iconKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    buttonState = MaterialStatesController();
    _overlayPortalController = OverlayPortalController();
  }

  @override
  void dispose() {
    buttonState.dispose();
    _overlayPortalController.hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
        controller: _overlayPortalController,
        overlayChildBuilder: (context) {
          final size = Size(MediaQuery.sizeOf(context).width * 0.35,
              MediaQuery.sizeOf(context).width * 0.6);
          final box = iconKey.currentContext!.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset(-size.width, 0));
          return Positioned(
            top: pos.dy + box.size.width / 2,
            left: pos.dx + (box.size.height / 2),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: const Color(WebColorAsset.menu),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                border: Border.all(color: const Color(WebColorAsset.bgYellow)),
              ),
              child: DropDownMenuWidget(
                widget.pageController,
                headerMenuItems: widget.menuItems
                  ..removeWhere((key, value) => key.startsWith('Ping Me')),
              ),
            ),
          );
        },
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            children: [
              const Image(image: AssetImage(WebImageAssets.logo)),
              const Spacer(),
              ListenableBuilder(
                  listenable: buttonState,
                  builder: (context, _) {
                    return ElevatedButton(
                      statesController: buttonState,
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 16)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color(WebColorAsset.bgYellow)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        overlayColor: const MaterialStatePropertyAll(
                            Color(WebColorAsset.bgYellow)),
                      ),
                      onPressed: () => launchUrlString(
                        'https://www.linkedin.com/in/dishankjindal/',
                        mode: LaunchMode.externalApplication,
                      ),
                      child: Text(
                        'Hire me',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: buttonState.value
                                    .contains(MaterialState.hovered)
                                ? const Color(WebColorAsset.bgBlack)
                                : null),
                      ),
                    );
                  }),
              const Gap.w(24),
              GestureDetector(
                onTap: () {
                  _overlayPortalController.toggle();
                },
                child: Image(
                  key: iconKey,
                  image: const AssetImage(WebImageAssets.menu),
                ),
              ),
            ],
          ),
        ));
  }
}

class DropDownMenuWidget extends StatelessWidget {
  final PageController pageController;
  final Map<String, VoidCallback?> headerMenuItems;

  const DropDownMenuWidget(
    this.pageController, {
    required this.headerMenuItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> items = [];
    final List<VoidCallback> callbacks = [];
    final int totalCount = headerMenuItems.entries.length;
    for (var element in headerMenuItems.entries) {
      items.add(element.key);
      callbacks.add(element.value ?? () {});
    }
    return ListenableBuilder(
        listenable: pageController,
        builder: (context, _) {
          return ListView.builder(
              itemCount: totalCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextButton(
                    onPressed: callbacks[index],
                    child: Text(
                      items[index],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: pageController.page == index
                              ? const Color(WebColorAsset.bgYellow)
                              : null),
                    ),
                  ),
                );
              });
        });
  }
}

class WebHeaderView extends StatelessWidget {
  final PageController pageController;
  final Map<String, VoidCallback?> menuItems;

  const WebHeaderView(
    this.pageController, {
    required this.menuItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Material(
      key: WebGlobalKey.headerKey,
      type: MaterialType.transparency,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: max(100, size.height * 0.15),
        ),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(WebColorAsset.bgBlack),
          border: Border.all(
            color: const Color(WebColorAsset.bgYellow),
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Image(
            image: AssetImage(WebImageAssets.logo),
          ),
          const Spacer(),
          ListenableBuilder(
            listenable: pageController,
            builder: (context, _) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(menuItems.length, (index) {
                  if (index == menuItems.length - 1) {
                    return ButtonHighlightOnHover.dark(
                      'Ping Me',
                      callback: () => launchUrlString(
                        'https://www.linkedin.com/in/dishankjindal/',
                        mode: LaunchMode.externalApplication,
                      ),
                    );
                  }

                  final item = menuItems.entries.elementAt(index);
                  return Builder(builder: (context) {
                    bool isHovering = index == (pageController.page ?? 0);

                    return StatefulBuilder(
                        builder: (context, miniState) => Container(
                              margin: const EdgeInsets.only(right: 24),
                              child: MouseRegion(
                                onHover: (details) {
                                  miniState(() {
                                    isHovering = true;
                                  });
                                },
                                onExit: (_) {
                                  miniState(() {
                                    isHovering = false;
                                  });
                                },
                                child: TextButton(
                                  onPressed: item.value,
                                  child: Text(
                                    item.key,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: pageController.page == index ||
                                                  isHovering
                                              ? const Color(
                                                  WebColorAsset.bgYellow)
                                              : null,
                                        ),
                                  ),
                                ),
                              ),
                            ));
                  });
                }),
              );
            },
          ),
          Gap.w(size.width * 0.02),
        ]),
      ),
    );
  }
}
