import 'package:animated_text_kit/animated_text_kit.dart';
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
    return DefaultTextStyle(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(widget.message[0]),
              TypewriterAnimatedText(
                  widget.message[0] + " " + widget.message[1],
                  cursor: ''),
            ],
            onFinished: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
          flag
              ? AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: isLandscapeView
                      ? [
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
                              fontSize: media.size.width / 15,
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
                              fontSize: media.size.width / 30,
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
                        ]
                      : [
                          FlickerAnimatedText(
                            widget.message[2],
                            textStyle: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: media.size.width / 10,
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
                          FlickerAnimatedText(
                            widget.message[3],
                            textStyle: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: media.size.width / 10,
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
                          TyperAnimatedText(
                            widget.message[2] + " & " + widget.message[3],
                            textStyle: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: media.size.width / 20,
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
                          )
                        ],
                  onFinished: () {
                    setState(() {
                      flag1 = !flag1;
                    });
                  },
                )
              : Container(),
          flag1
              ? AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(widget.message[4]),
                  ],
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
    );
  }
}
