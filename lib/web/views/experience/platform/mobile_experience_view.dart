import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:dishank_dev_resume_website/web/views/commons/page_dot/page_dot_variant.dart';
import 'package:flutter/material.dart';

class MobileExperienceView extends StatefulWidget {
  final List<String> data;

  const MobileExperienceView({
    required this.data,
    super.key,
  });

  @override
  State<MobileExperienceView> createState() => _MobileExperienceViewState();
}

class _MobileExperienceViewState extends State<MobileExperienceView> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        const HeaderFill(),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: size.width * 0.6,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(AppColor.bgYellow),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
            ),
          ),
        ),
        const Gap(8),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: size.width * 0.5,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(AppColor.bgYellow),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Gap(size.width * 0.1),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppText.experiencetext1,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                height: 0.5,
                              ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: size.width * 0.5,
                        height: 1,
                        margin: const EdgeInsets.only(left: 24),
                        color: const Color(AppColor.bgYellow),
                      ),
                    ),
                    const Gap(4),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: size.width * 0.5,
                        height: 1,
                        margin: const EdgeInsets.only(left: 48),
                        color: const Color(AppColor.bgYellow),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(size.width * 0.1),
              const Spacer(),
              SizedBox(
                height: size.height * 0.6,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 6,
                            color: Color(AppColor.bgYellow),
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 4)
                              .add(const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16)),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(AppColor.bgOrange),
                                size: 24,
                              ),
                              Gap(size.width * 0.05),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Text(
                                    widget.data[index],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                          height: 1.5,
                                          color:
                                              const Color(AppColor.textBlack),
                                        ),
                                  ),
                                ),
                              ),
                              Gap(size.width * 0.1),
                              const Icon(
                                Icons.circle,
                                color: Color(AppColor.bgBlack),
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: widget.data.length,
                ),
              ),
              Gap(size.width * 0.05),
              PageDotVariant.horizontal(
                _pageController,
                totalPages: widget.data.length,
              ),
              Gap(size.width * 0.05),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
