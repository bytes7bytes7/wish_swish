import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'always_bouncing_scroll_physics.dart';
import 'counter_bloc.dart';
import 'counter_repo.dart';
import 'l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(
        const CounterRepoImpl(),
      ),
      child: MaterialApp(
        title: 'Wish Swish'.trim(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''),
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    var hasInternet = true;
    Connectivity().checkConnectivity().then((value) {
      switch (value) {
        case ConnectivityResult.none:
          hasInternet = false;
          break;
        default:
          hasInternet = true;
      }
    });
    Connectivity().onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.none:
          hasInternet = false;
          break;
        default:
          hasInternet = true;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.helloWorld),
        actions: [
          IconButton(
            icon: const Icon(Icons.next_plan_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SecondScreen()),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        notificationPredicate: (_) => hasInternet,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          //
        },
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysBouncingScrollPhysics(),
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is CounterDataState) {
                  return Text(
                    context.l10n.timesPushed(state.value),
                  );
                }

                return const Text(
                  'Press on some button to start',
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(const CounterDecrementEvent()),
            heroTag: 'Decrement',
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(const CounterIncrementEvent()),
            tooltip: 'Increment',
            heroTag: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is CounterDataState) {
              return Text(
                context.l10n.timesPushed(state.value),
              );
            }

            return const Text(
              'Not started yet.',
            );
          },
        ),
      ),
    );
  }
}
