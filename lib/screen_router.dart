// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'constants/routes.dart' as const_routes;
import 'screens/screens.dart';

class ScreenRouter {
  ScreenRouter._();

  static final inst = ScreenRouter._();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route navigate(RouteSettings settings) {
    final name = settings.name ?? '';
    final args = <String, Object?>{};
    final rawArgs = settings.arguments;
    if (rawArgs is Map<String, Object?>) {
      args.addAll(rawArgs);
    }

    switch (name) {
      case const_routes.auth:
        return _route(const AuthScreen());
      case const_routes.home:
        return _route(const HomeScreen());
      default:
        return _route(const NotFoundScreen());
    }
  }

  MaterialPageRoute _route(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);
}
