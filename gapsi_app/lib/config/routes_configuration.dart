import 'package:flutter/material.dart';
import 'package:gapsi_app/config/route_path.dart';
import 'package:page_transition/page_transition.dart';

import '../view/admin_proveedores_view.dart';
import '../view/home_view.dart';

class RouteConfiguration {
  static List<RoutePath> paths = [
    RoutePath(
      r'^' + HomeView.routeName,
          (match, arguments) => const HomeView(),
    ),
    RoutePath(
      r'^' + AdminProveedoresView.routeName,
          (match, arguments) => const AdminProveedoresView(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name ?? '')) {
        final firstMatch = regExpPattern.firstMatch(settings.name ?? '');
        final match =
        (firstMatch?.groupCount == 1) ? firstMatch?.group(1) : null;
        return PageTransition(
          child: path.builder(match ?? '', settings.arguments ?? ''),
          type: PageTransitionType.fade,
          curve: Curves.fastOutSlowIn,
          settings: settings,
        );
      }
    }
    return null;
  }
}