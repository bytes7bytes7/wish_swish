import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../l10n/l10n.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          const_app.appName,
        ),
      ),
      body: Center(
        child: Text(l10n.navError),
      ),
    );
  }
}
