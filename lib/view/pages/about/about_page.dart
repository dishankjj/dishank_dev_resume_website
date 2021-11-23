import 'package:dishankdev/view/pages/about/description/description_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    if (media.orientation == Orientation.landscape) {
      return _landscape(context, media);
    } else {
      return _portrait(context, media);
    }
  }

  _landscape(context, media) {
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

  _portrait(context, media) {
    return SizedBox(
      width: media.size.width / 2,
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            alignment: Alignment.center,
            width: media.size.width / 2,
            color: Theme.of(context).backgroundColor,
            child: const Text('About Page'),
          ),
          const DescriptionPartA(),
          const DescriptionPartB(),
          const DescriptionPartC(),
        ],
      ),
    );
  }
}
