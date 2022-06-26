import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../constants/app.dart' as const_app;
import '../constants/measures.dart' as const_measures;
import '../widgets/widgets.dart';
import 'cart_screen.dart';
import 'category_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<bool> _hasConnection;
  late final StreamSubscription _sub;
  final _connectivity = Connectivity();
  var _screenIndex = 0;

  static const _screens = [
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();

    _hasConnection = ValueNotifier(true);
    _connectivity.checkConnectivity().then(_onConnectivityChanged);
    _sub = _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
  }

  void _onConnectivityChanged(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        _hasConnection.value = true;
        break;
      default:
        _hasConnection.value = false;
        break;
    }
  }

  @override
  void dispose() {
    _hasConnection.dispose();
    _sub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionInherited(
      hasConnection: _hasConnection,
      child: Scaffold(
        appBar: _screenIndex != 2
            ? NetworkAppBar(
                title: const_app.appName,
                hasConnection: _hasConnection,
              )
            : null,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: const_measures.mainHorPadding,
            ),
            child: _screens[_screenIndex],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '',
            ),
          ],
          currentIndex: _screenIndex,
          onTap: _onChangeScreen,
        ),
      ),
    );
  }

  void _onChangeScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }
}
