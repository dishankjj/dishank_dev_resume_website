import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget(this.message, {Key? key}) : super(key: key);
  final List<String> message;

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  bool flag = false;
  bool flag1 = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var isLandscapeView = media.orientation == Orientation.landscape;
    return Center(
      child: SizedBox(
        width: media.size.width / (isLandscapeView ? 1.5 : 1.1),
        child: DefaultTextStyle(
          child: Stack(
            children: [
              Positioned(
                top: media.size.height / (isLandscapeView ? 3 : 2.5),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText(widget.message[0]),
                    TypewriterAnimatedText(
                        widget.message[0] + " " + widget.message[1])
                  ],
                  onFinished: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ),
              flag
                  ? Positioned(
                      top: media.size.height / (isLandscapeView ? 2.25 : 2.22),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts:
                            // isLandscapeView ?
                            [
                          ColorizeAnimatedText(
                            widget.message[2],
                            colors: [
                              Colors.red,
                              Colors.green,
                              Colors.blue,
                            ],
                            speed: const Duration(milliseconds: 75),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: media.size.width /
                                  (isLandscapeView ? 15 : 10),
                              letterSpacing: 5,
                              shadows: const [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.white,
                                  offset: Offset(2.0, 3.0),
                                ),
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(-2.0, 3.0),
                                ),
                              ],
                            ),
                          ),
                          ColorizeAnimatedText(
                            widget.message[3],
                            colors: [
                              Colors.red,
                              Colors.green,
                              Colors.blue,
                            ],
                            speed: const Duration(milliseconds: 75),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: media.size.width /
                                  (isLandscapeView ? 15 : 10),
                              letterSpacing: 5,
                              shadows: const [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.white,
                                  offset: Offset(2.0, 3.0),
                                ),
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(-2.0, 3.0),
                                ),
                              ],
                            ),
                          ),
                          ColorizeAnimatedText(
                            widget.message[2] + " & " + widget.message[3],
                            colors: [
                              Colors.red,
                              Colors.green,
                              Colors.blue,
                            ],
                            speed: const Duration(milliseconds: 0),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: media.size.width /
                                  (isLandscapeView ? 30 : 20),
                              letterSpacing: 5,
                              shadows: const [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.white,
                                  offset: Offset(2.0, 3.0),
                                ),
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(-2.0, 3.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onFinished: () {
                          setState(() {
                            flag1 = !flag1;
                          });
                        },
                      ),
                    )
                  : Container(),
              flag1
                  ? Positioned(
                      top: media.size.height / (isLandscapeView ? 1.8 : 2),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(widget.message[4]),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: media.size.width / (isLandscapeView ? 30 : 20),
            letterSpacing: 5,
            shadows: const [
              Shadow(
                blurRadius: 3.0,
                color: Colors.white,
                offset: Offset(2.0, 3.0),
              ),
              Shadow(
                blurRadius: 3.0,
                color: Colors.black,
                offset: Offset(-2.0, 3.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
