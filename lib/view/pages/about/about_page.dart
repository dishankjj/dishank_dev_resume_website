import 'package:dishankdev/view/pages/about/description/description_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: media.size.width / 2,
          color: Theme.of(context).backgroundColor,
          child: const Text('About Page'),
        ),
        SizedBox(
          width: media.size.width / 2,
          child: PageView(
            scrollDirection: Axis.vertical,
            children: const [
              DescriptionPartA(),
              DescriptionPartB(),
              DescriptionPartC(),
            ],
          ),
        ),
      ],
    );
  }
}
