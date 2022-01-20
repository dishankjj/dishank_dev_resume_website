import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              height: media.size.height * 0.9,
              width: media.size.width,
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                // No need to remove color opacity
                color: Colors.black.withOpacity(0.5),
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.05, -0.4),
                      child: Card(
                        color: Colors.black45,
                        child: Container(
                          alignment: Alignment.center,
                          height: media.size.height * 0.8,
                          width: media.size.width / 3,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0),
                      child: Card(
                        color: Colors.black,
                        child: Container(
                          alignment: Alignment.center,
                          height: media.size.height * 0.8,
                          width: media.size.width / 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: media.size.height * 0.1,
              color: Theme.of(context).backgroundColor,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                // color: Colors.orange,
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
            ),
          ],
        ),
      ],
    );
  }
}
