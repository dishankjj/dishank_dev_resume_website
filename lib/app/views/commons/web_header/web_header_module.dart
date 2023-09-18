import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/utilities/image_assets.dart';
import 'package:flutter/material.dart';

class WebHeaderModule extends StatelessWidget {
  const WebHeaderModule(this.pageController, {super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final Map<String, VoidCallback?> data = {
      'Home': null,
      'Expertise': null,
      'Experience': null,
      'Certification': null,
      'Contact': null,
      'HireMe': null,
    };

    return Material(
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
                      return Builder(builder: (context) {
                        bool isHovering = false;
                        return StatefulBuilder(builder: (context, miniState) {
                          return MouseRegion(
                            onHover: (_) {
                              miniState(() {
                                isHovering = true;
                              });
                            },
                            onExit: (_) {
                              miniState(() {
                                isHovering = false;
                              });
                            },
                            child: SizedBox(
                              height: 68,
                              width: size.width * 0.075,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      isHovering
                                          ? const Color(WebColorAsset.bgYellow)
                                          : const Color(WebColorAsset.bgBlack)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 2,
                                          color: Color(WebColorAsset.bgYellow),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Hire Me',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: isHovering
                                            ? const Color(WebColorAsset.bgBlack)
                                            : const Color(
                                                WebColorAsset.textWhite),
                                      ),
                                ),
                              ),
                            ),
                          );
                        });
                      });
                    }

                    final item = data.entries.elementAt(index);
                    return Builder(builder: (context) {
                      bool isHovering = false;

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
