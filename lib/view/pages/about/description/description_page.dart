import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
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

class DescriptionImage extends StatefulWidget {
  const DescriptionImage(
      {this.image, this.width, this.height, this.backgroundColor, Key? key})
      : super(key: key);
  final String? image;
  final double? width;
  final double? height;
  final Color? backgroundColor;

  @override
  State<DescriptionImage> createState() => _DescriptionImageState();
}

class _DescriptionImageState extends State<DescriptionImage> {
  Future<Uint8List?> imageData = FirebaseStorage.instance
      .ref()
      .child('images')
      .child('computer_16x9.jpeg')
      .getData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: imageData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Description('error');
        }
        return snapshot.hasData
            ? Card(
                child: Container(
                  height:
                      widget.height ?? MediaQuery.of(context).size.height / 2.5,
                  width:
                      widget.width ?? MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: MemoryImage(
                        snapshot.data!,
                      ),
                    ),
                  ),
                ),
              )
            : Card(
                child: Container(
                  height:
                      widget.height ?? MediaQuery.of(context).size.height / 2.5,
                  width:
                      widget.width ?? MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
      },
    );
  }
}
