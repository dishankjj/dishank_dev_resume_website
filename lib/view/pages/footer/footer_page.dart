import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterPage extends StatelessWidget {
  const FooterPage(this.pageController, {Key? key}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: media.size.height * 0.9,
              color: Colors.white,
            ),
            Container(
              alignment: Alignment.center,
              height: media.size.height * 0.1,
              color: Theme.of(context).backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: 'Made'),
                        TextSpan(text: ' '),
                        TextSpan(text: 'with'),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  MirrorAnimation<double>(
                    tween: Tween(
                      begin: 0.9,
                      end: 1.1,
                    ),
                    duration: const Duration(seconds: 1),
                    builder: (context, child, value) {
                      return Transform.scale(
                        scale: value,
                        child: GestureDetector(
                          onTap: () async {
                            await launch('https://flutter.dev/');
                          },
                          child: const FlutterLogo(),
                        ),
                      );
                    },
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: ' '),
                        TextSpan(text: 'by'),
                        TextSpan(text: ' '),
                        TextSpan(text: 'Dishank'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // BackToTopIconWidget(pageController: pageController),
      ],
    );
  }
}
