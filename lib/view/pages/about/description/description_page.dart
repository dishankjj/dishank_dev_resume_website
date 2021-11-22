import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionPartA extends StatelessWidget {
  const DescriptionPartA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text('Part A'),
      ),
    );
  }
}

class DescriptionPartB extends StatelessWidget {
  const DescriptionPartB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('Part B'),
      ),
    );
  }
}

class DescriptionPartC extends StatelessWidget {
  const DescriptionPartC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Part C'),
      ),
    );
  }
}
