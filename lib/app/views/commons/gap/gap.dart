import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap(
    this.dimension, {
    super.key,
  })  : height = null,
        width = null;

  const Gap.width(this.width, {super.key})
      : dimension = null,
        height = null;

  const Gap.height(this.height, {super.key})
      : dimension = null,
        width = null;

  final double? dimension;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (dimension != null) {
      return SizedBox.square(dimension: dimension);
    }
    return SizedBox(height: height, width: width);
  }
}
