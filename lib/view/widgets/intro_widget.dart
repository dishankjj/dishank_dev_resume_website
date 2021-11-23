import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget(this.message, {Key? key}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    if (media.orientation == Orientation.landscape) {
      return _landscape(context, media);
    } else {
      return _portrait(context, media);
    }
  }

  _landscape(context, media) => Center(
        child: SizedBox(
          width: media.size.width / 1.5,
          child: SelectableText(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: media.size.width / 35,
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
  _portrait(context, media) => Center(
        child: SizedBox(
          width: media.size.width,
          child: SelectableText(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: media.size.width / 25,
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
