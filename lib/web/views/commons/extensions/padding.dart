import 'package:flutter/material.dart';

extension UiPaddingExtension on Widget {
  Widget padding(final EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }
}
