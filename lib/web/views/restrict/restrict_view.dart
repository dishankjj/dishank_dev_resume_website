import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/utilities/image_assets.dart';
import 'package:dishank_dev_resume_website/web/views/commons/gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class RestrictView extends StatelessWidget {
  final bool withBg;

  const RestrictView({
    this.withBg = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: withBg ? MaterialType.canvas : MaterialType.transparency,
      color: withBg ? const Color(AppColor.bgBlack) : null,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        decoration: withBg
            ? const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(WebImageAssets.background1),
                  alignment: Alignment.topLeft,
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const RingExpanding(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(WebImageAssets.logo),
                ),
                const Gap(24),
                Text(
                  'Please view after some time!\ncoming soon.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Code is poetry - every line has a purpose,\nand every function tells a story.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RingExpanding extends StatefulWidget {
  const RingExpanding({super.key});

  @override
  State<RingExpanding> createState() => _RingExpandingState();
}

class _RingExpandingState extends State<RingExpanding>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final Tween<double> scaleValue;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    const spring = SpringDescription(
      mass: 40,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, 1);

    controller.animateWith(simulation);

    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Opacity(
            opacity: controller.value,
            child: SizedBox.square(
              dimension: 500 * controller.value,
              child: const Material(
                type: MaterialType.transparency,
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(AppColor.bgYellow),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
