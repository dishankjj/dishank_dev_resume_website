import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/global_keys.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/app/views/commons/buttons/buttton_highlight_on_hover.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebHeaderModule extends StatelessWidget {
  const WebHeaderModule(this.pageController, {super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final Map<String, VoidCallback?> data = {
      'Home': () => pageController.jumpToPage(0),
      'Expertise': () => pageController.jumpToPage(1),
      'Experience': () => pageController.jumpToPage(2),
      'Certification': () => pageController.jumpToPage(3),
      'Contact': () => pageController.jumpToPage(4),
      'Ping Me': null,
    };

    return Material(
      key: WebGlobalKey.headerKey,
      type: MaterialType.transparency,
      child: Container(
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
          SizedBox(
            height: size.height,
            child: const Image(
              image: AssetImage(WebImageAssets.logo),
              fit: BoxFit.fitHeight,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: size.width * 0.55,
            child: ListenableBuilder(
              listenable: pageController,
              builder: (context, _) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(data.length, (index) {
                    if (index == data.length - 1) {
                      return ButtonHighlightOnHover.dark(
                        'Ping Me',
                        callback: () => launchUrlString(
                          'https://www.linkedin.com/in/dishankjindal/',
                          mode: LaunchMode.externalApplication,
                        ),
                      );
                    }

                    final item = data.entries.elementAt(index);
                    return Builder(builder: (context) {
                      bool isHovering = index == (pageController.page ?? 0);

                      return StatefulBuilder(
                          builder: (context, miniState) => MouseRegion(
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
                              ));
                    });
                  }),
                );
              },
            ),
          ),
          SizedBox(width: size.width * 0.02),
        ]),
      ),
    );
  }
}
