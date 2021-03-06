// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:product_repo/product_repo.dart';

import 'constants/app.dart' as const_app;
import 'constants/routes.dart' as const_routes;
import 'screens/products_screen.dart';
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
      case const_routes.products:
        final category = args[const_app.category];
        final hasConnection = args[const_app.hasConnection];
        if (category is Category && hasConnection is ValueNotifier<bool>) {
          return _route(
            ProductsScreen(
              category: category,
              hasConnection: hasConnection,
            ),
          );
        }

        return _route(const NotFoundScreen());
      default:
        return _route(const NotFoundScreen());
    }
  }

  MaterialPageRoute _route(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);
}
