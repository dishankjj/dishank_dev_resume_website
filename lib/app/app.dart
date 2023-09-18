import 'package:dishank_dev_resume_website/app/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/app/views/main_view.dart';
import 'package:dishank_dev_resume_website/app/views/restrict_view/restrict_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<NavigatorState> navState = GlobalKey();

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
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
                fontSize: 60,
                height: 1.25,
                fontWeight: FontWeight.w700,
                color: Color(WebColorAsset.textWhite),
              ),
              titleLarge: TextStyle(
                fontSize: 48,
                height: 1.25,
                fontWeight: FontWeight.w700,
                color: Color(WebColorAsset.textWhite),
              ),
              titleMedium: TextStyle(
                fontSize: 42,
                height: 1.25,
                fontWeight: FontWeight.w600,
                color: Color(WebColorAsset.textWhite),
              ),
              bodyMedium: TextStyle(
                fontSize: 24,
                height: 1.25,
                fontWeight: FontWeight.w500,
                color: Color(WebColorAsset.textWhite),
              ),
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.minWidth < 1560) {
              return const RestrictView();
            }
            return SizedBox(
              child: child,
            );
          }),
        );
      },
    );
  }
}
