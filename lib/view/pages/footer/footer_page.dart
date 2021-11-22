import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              height: media.size.height * 9 / 10,
              color: Colors.white,
            ),
            Container(
              alignment: Alignment.center,
              height: media.size.height / 10,
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
                  GestureDetector(
                      onTap: () async {
                        await launch('https://flutter.dev/');
                      },
                      child: const FlutterLogo()),
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
        Positioned(
          bottom: (media.size.height / 10) + 25,
          right: 15,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).backgroundColor,
            onPressed: () {
              pageController.animateToPage(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
            child: const Icon(
              Icons.arrow_upward_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
