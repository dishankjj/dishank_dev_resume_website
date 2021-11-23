import 'package:dishankdev/view/pages/about/description/description_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var orientation = media.orientation == Orientation.landscape;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          direction: Axis.vertical,
          spacing: 25,
          runSpacing: 25,
          children: [
            Description(
              'About page',
              width: media.size.width,
              height: media.size.height,
            ),
            DescriptionCard(
              'Part A',
              width: media.size.width,
              height: media.size.height / 2.5,
              backgroundColor: Colors.red,
            ),
            DescriptionCard(
              'Part B',
              width: media.size.width * 0.70,
              height: media.size.height / 2.5,
              backgroundColor: Colors.black,
            ),
            DescriptionCard(
              'Part C',
              width: media.size.width * 0.20,
              height: media.size.height / 2.5,
              backgroundColor: Colors.black,
            ),
            DescriptionCard(
              'Part D',
              width: media.size.width * 0.50,
              height: media.size.height / 2.5,
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
