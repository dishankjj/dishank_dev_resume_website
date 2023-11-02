import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:flutter/material.dart';

class PageDotModule extends StatelessWidget {
  final PageController pageController;
  final int totalPages;

  const PageDotModule(
    this.pageController, {
    this.totalPages = 3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.95, 0.95),
      child: SizedBox(
        height: 100,
        width: 12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            totalPages,
            (index) => InkWell(
              onTap: () {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut);
              },
              child: SizedBox.square(
                dimension: 12,
                child: ListenableBuilder(
                    listenable: pageController,
                    builder: (context, _) {
                      return Transform.scale(
                        scale: (pageController.page?.round() ?? 0) == index
                            ? 1
                            : 0.6,
                        child: CircleAvatar(
                          backgroundColor:
                              (pageController.page?.round() ?? 0) == index
                                  ? const Color(AppColor.bgOrange)
                                  : const Color(AppColor.bgWhite),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
