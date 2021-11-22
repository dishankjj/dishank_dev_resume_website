import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenBackgroundImage extends StatelessWidget {
  const FullScreenBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    if (media.orientation == Orientation.landscape) {
      return _landscape(context, media);
    } else {
      return _portrait(context, media);
    }
  }

  _portrait(context, media) => Container(
        width: media.size.width,
        height: media.size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/main-bg-image.jpeg'),
                fit: BoxFit.fitHeight)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      );

  _landscape(context, media) => Container(
        width: media.size.width,
        height: media.size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/main-bg-image.jpeg'),
                fit: BoxFit.fill)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      );
}
