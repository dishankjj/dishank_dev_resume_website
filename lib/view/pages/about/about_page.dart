import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishankdev/view/pages/about/description/description_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    CollectionReference aboutPage =
        FirebaseFirestore.instance.collection('about_page');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.only(right: 50),
        child: FutureBuilder<DocumentSnapshot>(
          future: aboutPage.doc('v1').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Description("Error Loading Data..");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Description("No Data..");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              return Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                direction: Axis.vertical,
                spacing: 25,
                runSpacing: 25,
                children: [
                  Description(data['description']),
                  SizedBox(
                    height: media.size.height * 0.45,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index.isEven) {
                          return DescriptionImage(
                            width: media.size.width *
                                ((Random().nextInt(3) + 2) / 10),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: media.size.height * 0.45,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index.isOdd) {
                          return DescriptionImage(
                            width: media.size.width *
                                ((Random().nextInt(3) + 2) / 10),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              );
            }
            return const Description('loading....');
          },
        ),
      ),
    );
  }
}
