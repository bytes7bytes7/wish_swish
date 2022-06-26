import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app.dart' as const_app;
import '../constants/routes.dart' as const_routes;
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(const_app.logoPath),
              Text(l10n.slogan),
              Text(l10n.authorization),
              SimpleTextField(
                hint: l10n.enterEmail,
              ),
              SimpleTextField(
                hint: l10n.enterPassword,
                isObscure: true,
              ),
              BigButton(
                onPressed: () {
                  Navigator.of(context)
                    ..popUntil((r) => r.isFirst)
                    ..pushReplacementNamed(const_routes.home);
                },
                title: l10n.logIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
