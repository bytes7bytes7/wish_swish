import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Text(l10n.navError),
      ),
    );
  }
}
