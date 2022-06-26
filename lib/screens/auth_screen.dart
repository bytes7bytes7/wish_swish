import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../constants/routes.dart' as const_routes;
import '../l10n/l10n.dart';
import '../widgets/widgets.dart';

final _emailExp = RegExp(r'^[\w.-]+@[A-Za-z0-9.-]+$');

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  late final ListenableTextController _emailController;
  late final ListenableTextController _passwordController;
  late final StreamSubscription _emailSub;
  late final StreamSubscription _passwdSub;
  late final ValueNotifier<bool> _isValid;

  @override
  void initState() {
    super.initState();

    // clear - позволяет пропустить первое значение `text`
    _emailController = ListenableTextController()..clear();
    _emailSub = _emailController.stream.listen((_) => _onChanged());
    _passwordController = ListenableTextController()..clear();
    _passwdSub = _passwordController.stream.listen((_) => _onChanged());
    _isValid = ValueNotifier(false);
  }

  void _onChanged() {
    if (_formKey.currentState?.validate() == true) {
      if (!_isValid.value) {
        _isValid.value = true;
      }
    } else {
      if (_isValid.value) {
        _isValid.value = false;
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailSub.cancel();
    _passwdSub.cancel();
    _isValid.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: const_measures.mainHorPadding,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: height,
              child: Column(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: const_measures.verPadding,
                          ),
                          child: SvgPicture.asset(const_app.logoPath),
                        ),
                        Text(
                          l10n.slogan,
                          style: theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: const_measures.midVerPadding,
                          ),
                          child: Text(l10n.authorization),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: const_measures.smallPadding,
                                ),
                                child: SimpleTextField(
                                  controller: _emailController,
                                  hint: l10n.enterEmail,
                                  validator: (value) {
                                    if (value == null ||
                                        _emailExp.allMatches(value).isEmpty) {
                                      return 'Невалидный email';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: const_measures.smallPadding,
                                ),
                                child: SimpleTextField(
                                  controller: _passwordController,
                                  hint: l10n.enterPassword,
                                  validator: (value) {
                                    if (value?.isNotEmpty == true) {
                                      return null;
                                    }

                                    return 'Введите пароль';
                                  },
                                  isObscure: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: const_measures.verPadding,
                          ),
                          child: ValueListenableBuilder<bool>(
                            valueListenable: _isValid,
                            builder: (context, value, child) {
                              return BigButton(
                                onPressed:
                                    value ? () => _toHome(context) : null,
                                title: l10n.logIn,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toHome(BuildContext context) {
    Navigator.of(context)
      ..popUntil((r) => r.isFirst)
      ..pushReplacementNamed(
        const_routes.home,
      );
  }
}
