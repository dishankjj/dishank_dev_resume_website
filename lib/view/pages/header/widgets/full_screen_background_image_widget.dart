import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenBackgroundImage extends StatelessWidget {
  const FullScreenBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var isLandscapeViewPort = media.orientation == Orientation.landscape;
    return Stack(
      children: [
        Container(
          width: media.size.width,
          height: media.size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/main-bg-image.jpeg'),
                  fit: isLandscapeViewPort ? BoxFit.fill : BoxFit.fitHeight)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        // Positioned(
        //   top: (media.size.height / 2) - 50,
        //   left: isLandscapeViewPort ? media.size.width - 250 : 10000,
        //   child: FlutterLogo(
        //     size: media.size.height / 5,
        //   ),
        // ),
      ],
    );
  }
}
