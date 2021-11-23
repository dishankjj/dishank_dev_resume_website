import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description(this.message,
      {this.width, this.height, this.backgroundColor, Key? key})
      : super(key: key);
  final String? message;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Center(
        child: Text(message ?? 'Example Text Description'),
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  const DescriptionCard(this.message,
      {this.width, this.height, this.backgroundColor, Key? key})
      : super(key: key);
  final String? message;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: backgroundColor,
        child: Center(
          child: Text(message ?? 'Example Text Description'),
        ),
      ),
    );
  }
}
