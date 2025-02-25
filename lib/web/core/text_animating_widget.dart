import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextAnimatingWidget extends StatefulWidget {
  const TextAnimatingWidget(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  State<TextAnimatingWidget> createState() => _TextAnimatingWidgetState();

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}

class _TextAnimatingWidgetState extends State<TextAnimatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  int loopCount = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    unawaited(
      Future<void>.delayed(const Duration(milliseconds: 1200)).then((_) {
        if (mounted) {
          _animationController.forward();
        }
      }),
    );

    _animationController.addStatusListener((final AnimationStatus status) {
      if (loopCount == widget.text.split(',').length - 1) {
        return;
      }
      if (status == AnimationStatus.completed) {
        unawaited(
          Future<void>.delayed(const Duration(milliseconds: 500)).then((_) {
            if (mounted) {
              _animationController.reverse();
            }
          }),
        );
      } else if (status == AnimationStatus.dismissed) {
        loopCount += 1;
        unawaited(
          Future<void>.delayed(const Duration(milliseconds: 200)).then((_) {
            if (mounted) {
              _animationController.forward();
            }
          }),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ListenableBuilder(
    listenable: _animationController,
    builder: (final BuildContext context, _) {
      final List<String> listOfString = widget.text.split(',');
      String animatedText = '';

      animatedText = listOfString[loopCount].substring(
        0,
        (listOfString[loopCount].length * _animationController.value).round(),
      );

      return Text("I'm $animatedText", style: widget.style);
    },
  );

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('loopCount', loopCount));
  }
}
