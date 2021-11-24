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
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
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
      height: height ?? MediaQuery.of(context).size.height / 2.5,
      width: width,
      child: Card(
        color: backgroundColor,
        child: Center(
          child: Text(message ?? 'Example Text Description'),
        ),
      ),
    );
  }
}

class DescriptionImage extends StatelessWidget {
  const DescriptionImage(
      {this.image, this.width, this.height, this.backgroundColor, Key? key})
      : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height / 2.5,
        width: width ?? MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              image ?? "https://tinyjpg.com/images/social/website.jpg",
              headers: {
                "Access-Control-Allow-Origin": "*",
              },
            ),
          ),
        ),
      ),
    );
  }
}
