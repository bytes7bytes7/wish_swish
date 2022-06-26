import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/blocs.dart';
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
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final l10n = context.l10n;
    final authBloc = context.read<AuthBloc>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.of(context)
            ..popUntil((r) => r.isFirst)
            ..pushReplacementNamed(
              const_routes.home,
            );
        } else if (state is AuthFailState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.error),
            ),
          );
        }
      },
      child: Scaffold(
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
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state is AuthLoadingState;

                          return Column(
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
                                        enabled: !isLoading,
                                        validator: _emailValidator,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: const_measures.smallPadding,
                                      ),
                                      child: SimpleTextField(
                                        controller: _passwordController,
                                        hint: l10n.enterPassword,
                                        enabled: !isLoading,
                                        validator: _passwordValidator,
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
                                      onPressed: (value && !isLoading)
                                          ? () => _logIn(authBloc)
                                          : null,
                                      child: isLoading
                                          ? const Center(
                                              child: LoadingCircle(),
                                            )
                                          : Text(
                                              l10n.logIn,
                                              style: theme.textTheme.button,
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _logIn(AuthBloc authBloc) {
    authBloc.add(
      AuthLogInEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  String? _emailValidator(String? value) {
    if (value == null || _emailExp.allMatches(value).isEmpty) {
      return 'Невалидный email';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value?.isNotEmpty == true) {
      return null;
    }

    return 'Введите пароль';
  }
}
