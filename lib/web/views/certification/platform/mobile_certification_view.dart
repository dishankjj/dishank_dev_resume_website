import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:flutter/material.dart';

class MobileCertificationView extends StatelessWidget {
  final PageController rootPageController;

  const MobileCertificationView({
    required this.rootPageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        const HeaderFill(spacer: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppText.certificationtext1,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        height: 0.5,
                      ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: size.width * 0.5,
                  height: 1,
                  margin: const EdgeInsets.only(left: 24),
                  color: const Color(AppColor.bgYellow),
                ),
              ),
              const Gap(4),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: size.width * 0.5,
                  height: 1,
                  margin: const EdgeInsets.only(right: 48),
                  color: const Color(AppColor.bgYellow),
                ),
              ),
            ],
          ),
        ),
        const Gap(48),
        const Gap(48),
        Expanded(
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showGeneralDialog(
                      context: context,
                      pageBuilder: (context, a, b) {
                        return ScaleTransition(
                          scale: CurvedAnimation(
                            parent: a,
                            curve: Curves.easeIn,
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Align(
                                child: Container(
                                  margin: const EdgeInsets.all(24),
                                  child: Image.network(
                                    AppUrl.certificateUrl(index),
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.topLeft,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Align(
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(AppColor.bgYellow),
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Image.network(
                        AppUrl.certificateUrl(index),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        cacheHeight: 50,
                        cacheWidth: 50,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 9,
          ),
        ),
        const Gap(48 * 2),
      ],
    );
  }
}
