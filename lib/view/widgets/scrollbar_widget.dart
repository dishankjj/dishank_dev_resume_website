import 'package:flutter/material.dart';

class ScrollBarWidget extends StatelessWidget {
  const ScrollBarWidget(this.onVerticalDragUpdate, this.offset, {Key? key})
      : super(key: key);

  final Function(DragUpdateDetails) onVerticalDragUpdate;
  final double offset;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var isLandscapeView = media.orientation == Orientation.landscape;
    return Container(
      alignment: Alignment.centerRight,
      height: media.size.height,
      width: media.size.width / (isLandscapeView ? 75 : 25),
      decoration: const BoxDecoration(color: Colors.black12),
      child: Container(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          child: Container(
            height: 40.0,
            width: 15.0,
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: offset),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
          ),
          onVerticalDragUpdate: onVerticalDragUpdate,
        ),
      ),
    );
  }
}
