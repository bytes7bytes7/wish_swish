import 'package:auth_repo/auth_repo.dart';
import 'package:cart_repo/cart_repo.dart';
import 'package:category_repo/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:order_repo/order_repo.dart';

import 'blocs/blocs.dart';
import 'constants/app.dart' as const_app;
import 'constants/routes.dart' as const_routes;
import 'l10n/l10n.dart';
import 'screen_router.dart';
import 'themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = OrderBloc(
      FakeOrderRepo(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            const FakeAuthRepo(),
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            const FakeCartRepo(),
            orderBloc,
          ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            const FakeCategoryRepo(),
          ),
        ),
        BlocProvider(
          create: (context) => orderBloc,
        ),
      ],
      child: MaterialApp(
        title: const_app.appName,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''),
        ],
        theme: lightTheme,
        navigatorKey: ScreenRouter.inst.navigatorKey,
        onGenerateInitialRoutes: (_) => [
          ScreenRouter.inst.navigate(
            const RouteSettings(name: const_routes.auth),
          ),
        ],
        onGenerateRoute: ScreenRouter.inst.navigate,
      ),
    );
  }
}
