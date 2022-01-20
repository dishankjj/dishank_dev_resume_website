import 'package:auto_size_text/auto_size_text.dart';
import 'package:dishankdev/view/pages/header/widgets/animated_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.25 / 2),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderButtonWidget(
                    message: 'GitHub',
                    urlString: 'https://github.com/dishankjj',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1 / 2,
                  ),
                  const HeaderButtonWidget(
                    message: 'LinkedIn',
                    urlString: 'https://www.linkedin.com/in/dishankjindal/',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1 / 2,
                  ),
                  Column(children: [
                    const HeaderButtonWidget(
                      message: 'Hire Me',
                      urlString: 'https://www.freelancer.com/u/dishankakadj',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1 / 2,
                    ),
                    const HeaderButtonWidget(
                      message: 'Resume',
                      urlString:
                          'https://drive.google.com/file/d/1V2VO29NJ0ahDDzYy16KqLc_XJfWAfwtY/view?usp=sharing',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1 / 2,
                    ),
                    const HeaderButtonWidget(
                      message: 'Live Apps',
                      urlString:
                          'https://play.google.com/store/apps/dev?id=6370796708077012430',
                    ),
                  ]),
                ],
              )),
          const Positioned(
            left: 0,
            child: AnimatedTextWidget([
              "Hi, I'm",
              "Dishank.",
              "Designs",
              "Develops",
              "interactive Ui/Ux"
            ]),
          ),
        ],
      ),
    );
  }
}

class HeaderButtonWidget extends StatelessWidget {
  const HeaderButtonWidget(
      {Key? key, required String message, required String urlString})
      : _message = message,
        _urlString = urlString,
        super(key: key);

  final String _message;
  final String _urlString;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.orange[900] ?? Colors.white),
      ),
      onPressed: () async => await launch(_urlString),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: AutoSizeText(_message),
      ),
    );
  }
}

      // Positioned(
      //       bottom: 0,
      //       child: MirrorAnimation<double>(
      //         tween: Tween(begin: 0, end: 20),
      //         duration: const Duration(seconds: 1),
      //         builder: (context, child, value) {
      //           return Positioned(
      //             bottom: value,
      //             child: GestureDetector(
      //               onTap: () {
      //                 // _pageController.nextPage(
      //                 //     duration: const Duration(seconds: 1),
      //                 //     curve: Curves.easeOut);
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: const [
      //                   Text(
      //                     'Scroll to see more...',
      //                     style: TextStyle(
      //                       color: Colors.white24,
      //                     ),
      //                   ),
      //                   Icon(
      //                     Icons.arrow_drop_down,
      //                     color: Colors.white24,
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
