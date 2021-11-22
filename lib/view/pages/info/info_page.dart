import 'package:dishankdev/view/widgets/background_widget.dart';
import 'package:dishankdev/view/widgets/intro_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage(this.pageController, {Key? key}) : super(key: key);

  final PageController pageController;

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool animatedButton = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Stack(
      alignment: AlignmentDirectional.center,
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
                  GestureDetector(
                    onTap: () {
                      animatedButton = !animatedButton;
                    },
                    child: const IntroductionWidget(
                        "Hi, I'm Dishank. \nDesigns & Develop interactive Ui/Ux."),
                  ),
                ],
              ),
        AnimatedPositioned(
          onEnd: () {
            animatedButton = !animatedButton;
          },
          duration: const Duration(seconds: 1),
          bottom: animatedButton ? 10 : 30,
          child: GestureDetector(
            onTap: () {
              widget.pageController.nextPage(
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
