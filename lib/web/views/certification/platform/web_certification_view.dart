import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/constant.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/header_fill.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WebCertificationView extends StatelessWidget {
  const WebCertificationView({required this.controller, super.key});
  final PageController controller;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        const HeaderFill(space: 32),
        const Gap(60),
        Align(
          child: Text(
            AppText.certificationText1,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(height: 0.5),
          ),
        ),
        const Gap(48),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ...List<Widget>.generate(
                9,
                (final int index) => GestureDetector(
                  onTap: () async {
                    await showGeneralDialog(
                      context: context,
                      pageBuilder: (final BuildContext context, final Animation<double> a, final Animation<double> b) {
                        return ScaleTransition(
                          scale: CurvedAnimation(parent: a, curve: Curves.easeIn),
                          child: Material(
                            type: MaterialType.transparency,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: InteractiveViewer(
                                child: Align(
                                  child: Container(
                                    margin: const EdgeInsets.all(24),
                                    child: Image.network(
                                      AppUrl.certificateUrl.replaceAll('{x}', '$index'),
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2, color: Color(AppColor.bgYellow)),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Image.network(
                        AppUrl.certificateUrl.replaceAll('{x}', '$index'),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Spacer(),
        const Gap(48 * 2),
      ],
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<PageController>('controller', controller));
  }
}
