import 'package:flutter/widgets.dart';

extension MediaScreenDimensionsUtility on BuildContext {
  T layout<T>({required final T mobile, required final T tablet, required final T web}) {
    final double aspectRatio = MediaQuery.sizeOf(this).aspectRatio;
    return switch (aspectRatio) {
      <= 0.65 => mobile,
      > 0.65 && <= 1.25 => tablet,
      > 1.25 => web,
      _ => web,
    };
  }

  MediaQueryData adaptiveLayout() {
    final Size size = MediaQuery.of(this).size;
    final double textScaleFactor = switch (size.aspectRatio) {
      <= 0.65 => size.width / 480,
      > 0.65 && <= 1.25 => size.width / 720,
      > 1.25 => size.width / 1270,
      _ => size.width / 1270,
    };

    return MediaQuery.of(this).copyWith(textScaler: TextScaler.linear(textScaleFactor));
  }
}
