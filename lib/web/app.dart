import 'package:dishank_dev_resume_website/web/utilities/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dishank_dev_resume_website/web/utilities/color_assets.dart';
import 'package:dishank_dev_resume_website/web/views/view.dart';
import 'package:dishank_dev_resume_website/web/views/restrict/restrict_view.dart';

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
              builder: (context) => const MainView(),
            );
          }
        }
        return MaterialPageRoute(
          builder: (context) => const RestrictView(),
        );
      },
      builder: (context, child) {
        ErrorWidget.builder = (errorDetails) => const RestrictView();

        return Theme(
            data: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme().copyWith(
                displayLarge: const TextStyle(
                  fontSize: 48,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Color(AppColor.textWhite),
                ),
                displayMedium: const TextStyle(
                  fontSize: 36,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Color(AppColor.textWhite),
                ),
                displaySmall: const TextStyle(
                  fontSize: 24,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Color(AppColor.textWhite),
                ),
                headlineLarge: const TextStyle(
                  fontSize: 24,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                headlineMedium: const TextStyle(
                  fontSize: 20,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                headlineSmall: const TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                titleLarge: const TextStyle(
                  fontSize: 20,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                titleMedium: const TextStyle(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                titleSmall: const TextStyle(
                  fontSize: 12,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                bodyLarge: const TextStyle(
                  fontSize: 14,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                bodyMedium: const TextStyle(
                  fontSize: 12,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                bodySmall: const TextStyle(
                  fontSize: 10,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                labelLarge: const TextStyle(
                  fontSize: 12,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                labelMedium: const TextStyle(
                  fontSize: 10,
                  height: 1.25,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.textWhite),
                ),
                labelSmall: const TextStyle(
                  fontSize: 8,
                  height: 1.25,
                  fontWeight: FontWeight.w300,
                  color: Color(AppColor.textWhite),
                ),
              ),
            ),
            child: MediaQuery(
              data: context.adaptiveLayout(),
              child: context.layout(
                mobile: SizedBox(child: child),
                tablet: const RestrictView(),
                web: const RestrictView(),
              ),
            ));
      },
    );
  }
}
