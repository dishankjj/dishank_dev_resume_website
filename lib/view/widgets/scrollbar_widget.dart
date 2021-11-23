import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollBar extends StatelessWidget {
  const ScrollBar({
    Key? key,
    required double offset,
    required PageController pageController,
  })  : _offset = offset,
        _pageController = pageController,
        super(key: key);

  final double _offset;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var orientation = media.orientation == Orientation.landscape;
    return Container(
      alignment: Alignment.centerRight,
      height: media.size.height,
      width: media.size.width / (orientation ? 75 : 25),
      decoration: const BoxDecoration(color: Colors.black12),
      child: Container(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          child: Container(
            height: 40.0,
            width: 15.0,
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: _offset),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
          ),
          onVerticalDragUpdate: (dragUpdate) {
            _pageController.position.moveTo(
                dragUpdate.globalPosition.dy * (orientation ? 2.25 : 2.2));
          },
        ),
      ),
    );
  }
}
