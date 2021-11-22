import 'package:dishankdev/view/widgets/background_widget.dart';
import 'package:dishankdev/view/widgets/intro_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage(this.pageController, {Key? key}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Stack(
      children: [
        const FullScreenBackgroundImage(),
        media.orientation == Orientation.landscape
            ? Row(
                children: [
                  FlutterLogo(
                    size: media.size.width / 5,
                  ),
                  const IntroductionWidget(
                      "Hi, I'm Dishank. \nDesigns & Develop interactive Ui/Ux."),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: media.size.width / 5,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const IntroductionWidget(
                      "Hi, I'm Dishank. \nDesigns & Develop interactive Ui/Ux."),
                ],
              ),
        Positioned(
          bottom: 10,
          left: media.size.width / 2 - 50, // width/2
          child: GestureDetector(
            onTap: () {
              pageController.nextPage(
                  duration: const Duration(seconds: 1), curve: Curves.easeOut);
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
        ),
      ],
    );
  }
}