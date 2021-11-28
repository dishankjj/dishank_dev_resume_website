import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class BackToTopIconWidget extends StatelessWidget {
  const BackToTopIconWidget(this.animateToStartPageFn, this.checkEndOfPage,
      {Key? key})
      : super(key: key);

  final Function() animateToStartPageFn;
  final bool checkEndOfPage;

  @override
  Widget build(BuildContext context) {
    return checkEndOfPage
        ? MirrorAnimation<double>(
            tween: Tween(
                begin: (MediaQuery.of(context).size.height * 0.1) + 5,
                end: (MediaQuery.of(context).size.height * 0.1) + 25),
            duration: const Duration(seconds: 1),
            builder: (context, child, value) {
              return Positioned(
                top: value,
                right: 50,
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).backgroundColor,
                  onPressed: animateToStartPageFn,
                  child: const Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.white,
                  ),
                ),
              );
            },
          )
        : Container();
  }
}