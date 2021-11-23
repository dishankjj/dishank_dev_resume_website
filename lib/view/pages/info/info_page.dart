import 'package:dishankdev/view/widgets/background_widget.dart';
import 'package:dishankdev/view/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class IntroPage extends StatefulWidget {
  const IntroPage(this.pageController, {Key? key}) : super(key: key);

  final PageController pageController;

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const FullScreenBackgroundImage(),
        const HeaderWidget([
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
