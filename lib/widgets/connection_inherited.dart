import 'package:flutter/material.dart';

class ConnectionInherited extends InheritedWidget {
  const ConnectionInherited({
    super.key,
    required super.child,
    required this.hasConnection,
  });

  final ValueNotifier<bool> hasConnection;

  @override
  bool updateShouldNotify(ConnectionInherited oldWidget) =>
      hasConnection != oldWidget.hasConnection;

  static ConnectionInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ConnectionInherited>();
    if (result != null) {
      return result;
    }

    throw Exception('No ConnectionInherited found in context');
  }
}
