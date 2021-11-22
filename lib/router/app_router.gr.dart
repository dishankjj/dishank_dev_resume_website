// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

import '../view/view_dashboard.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EmptyRouterPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    ViewDashboardRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ViewDashboard());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(EmptyRouterPageRoute.name, path: '/', children: [
          _i1.RouteConfig('#redirect',
              path: '',
              parent: EmptyRouterPageRoute.name,
              redirectTo: 'welcomes-you',
              fullMatch: true),
          _i1.RouteConfig(ViewDashboardRoute.name,
              path: 'welcomes-you', parent: EmptyRouterPageRoute.name)
        ])
      ];
}

/// generated route for [_i1.EmptyRouterPage]
class EmptyRouterPageRoute extends _i1.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for [_i2.ViewDashboard]
class ViewDashboardRoute extends _i1.PageRouteInfo<void> {
  const ViewDashboardRoute() : super(name, path: 'welcomes-you');

  static const String name = 'ViewDashboardRoute';
}
