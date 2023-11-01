import 'package:dishank_dev_resume_website/app/utilities/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/views/main_view.dart';
import 'package:dishank_dev_resume_website/app/views/restrict_view/restrict_view.dart';

final GlobalKey<NavigatorState> navState = GlobalKey();

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      debugShowCheckedModeBanner: false,
      title: 'Dishank Jindal | Mobile Software Engineer',
      color: Colors.teal,
      navigatorKey: navState,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name != null) {
          if (settings.name!.startsWith('/')) {
            return MaterialPageRoute(
              builder: (context) => const MainWebView(),
            );
          }
        }
        return MaterialPageRoute(
          builder: (context) => const RestrictView(),
        );
      },
      textStyle: GoogleFonts.roboto(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(WebColorAsset.bgYellow),
            ),
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontSize: 36,
                height: 1.25,
                fontWeight: FontWeight.w700,
                color: Color(WebColorAsset.textWhite),
              ),
              titleLarge: TextStyle(
                fontSize: 24,
                height: 1.25,
                fontWeight: FontWeight.w700,
                color: Color(WebColorAsset.textWhite),
              ),
              titleMedium: TextStyle(
                fontSize: 24,
                height: 1.25,
                fontWeight: FontWeight.w600,
                color: Color(WebColorAsset.textWhite),
              ),
              headlineMedium: TextStyle(
                fontSize: 32,
                height: 1.25,
                fontWeight: FontWeight.w700,
                color: Color(WebColorAsset.textYellow),
              ),
              headlineSmall: TextStyle(
                fontSize: 28,
                height: 1.25,
                fontWeight: FontWeight.w600,
                color: Color(WebColorAsset.textWhite),
              ),
              bodyLarge: TextStyle(
                fontSize: 24,
                height: 1.25,
                fontWeight: FontWeight.w500,
                color: Color(WebColorAsset.textWhite),
              ),
              bodyMedium: TextStyle(
                fontSize: 20,
                height: 1.25,
                fontWeight: FontWeight.w400,
                color: Color(WebColorAsset.textWhite),
              ),
              bodySmall: TextStyle(
                fontSize: 20,
                height: 1.25,
                fontWeight: FontWeight.w400,
                color: Color(WebColorAsset.textWhite),
              ),
              labelLarge: TextStyle(
                fontSize: 12,
                height: 1.25,
                fontWeight: FontWeight.w400,
                color: Color(WebColorAsset.textWhite),
              ),
              labelMedium: TextStyle(
                fontSize: 10,
                height: 1.25,
                fontWeight: FontWeight.w400,
                color: Color(WebColorAsset.textWhite),
              ),
              labelSmall: TextStyle(
                fontSize: 8,
                height: 1.25,
                fontWeight: FontWeight.w400,
                color: Color(WebColorAsset.textWhite),
              ),
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            debugPrint(
                'text scale - ${MediaQuery.of(context).textScaleFactor}');
            debugPrint(
                'device scale - ${MediaQuery.of(context).devicePixelRatio}');
            return MediaQuery(
              data: context.adaptiveLayout(),
              child: context.layout(
                mobile: SizedBox(child: child),
                tablet: const RestrictView(),
                web: SizedBox(child: child),
              ),
            );
          }),
        );
      },
    );
  }
}
