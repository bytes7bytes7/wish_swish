import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

// ignore: prefer_mixin
class NetworkAppBar extends StatelessWidget with PreferredSizeWidget {
  const NetworkAppBar({
    super.key,
    required this.title,
    required this.hasConnection,
  });

  final String title;
  final ValueNotifier<bool> hasConnection;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ValueListenableBuilder<bool>(
      valueListenable: hasConnection,
      builder: (context, value, child) {
        return AppBar(
          title: Text(
            value ? title : l10n.noConnection,
          ),
        );
      },
    );
  }
}
