import 'package:flutter/material.dart';

extension WidgetBoxWrapExtension on Widget {
  Widget size(final double size) {
    return SizedBox.square(dimension: size, child: this);
  }
}
