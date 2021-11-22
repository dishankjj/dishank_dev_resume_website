import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dishankdev/view/view_dashboard.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    initial: true,
    path: '/',
    page: EmptyRouterPage,
    children: <AutoRoute>[
      AutoRoute(
        initial: true,
        path: 'welcomes-you',
        page: ViewDashboard,
      ),
    ],
  ),
  // CustomRoute(
  //     path: '/about.html',
  //     page: AboutDashboard,
  //     transitionsBuilder: TransitionsBuilders.slideBottom),
  // RedirectRoute(path: '*', redirectTo: '/404.html')
])
class $AppRouter {}
