import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:flutter/material.dart';

class WebPositionDotModule extends StatelessWidget {
  const WebPositionDotModule(this.pageController,
      {this.totalPages = 3, super.key});

  final PageController pageController;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: pageController,
        builder: (context, _) {
          return Column(
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
                    child: Transform.scale(
                      scale: (pageController.page ?? 0) == index ? 1 : 0.6,
                      child: CircleAvatar(
                        backgroundColor: (pageController.page ?? 0) == index
                            ? const Color(WebColorAsset.bgOrange)
                            : const Color(WebColorAsset.bgWhite),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
