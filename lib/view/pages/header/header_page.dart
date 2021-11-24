import 'package:dishankdev/view/pages/header/widgets/full_screen_background_image_widget.dart';
import 'package:dishankdev/view/pages/header/widgets/animated_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage(this.pageController, {Key? key}) : super(key: key);

  final PageController pageController;

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const FullScreenBackgroundImage(),
        const AnimatedTextWidget([
          "Hi, I'm",
          "Dishank.",
          "Designs",
          "Develops",
          "interactive Ui/Ux."
        ]),
        MirrorAnimation<double>(
          tween: Tween(begin: 0, end: 20),
          duration: const Duration(seconds: 1),
          builder: (context, child, value) {
            return Positioned(
              bottom: value,
              child: GestureDetector(
                onTap: () {
                  widget.pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Scroll to see more...',
                      style: TextStyle(
                        color: Colors.white24,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white24,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
