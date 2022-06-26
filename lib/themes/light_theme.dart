import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;
import '../constants/measures.dart' as const_measures;

const _buttonVerPadding = 21.0;
const _bottomNavBarIconSize = 24.0;
const _appBarElevation = 0.0;
const _centerAppBarTitle = false;

final lightTheme = ThemeData(
  primaryColor: const_colors.plainOcean,
  scaffoldBackgroundColor: const_colors.white,
  hintColor: const_colors.silverChalice,
  textTheme: _textTheme,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: const_colors.plainOcean,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const_colors.plainOcean,
    titleTextStyle: _textTheme.headline6,
    elevation: _appBarElevation,
    centerTitle: _centerAppBarTitle,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: _textTheme.subtitle1,
    errorStyle: const TextStyle(
      color: const_colors.monza,
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.gallery,
      ),
      borderRadius: BorderRadius.circular(
        const_measures.borderRadius,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.gallery,
      ),
      borderRadius: BorderRadius.circular(
        const_measures.borderRadius,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.plainOcean,
      ),
      borderRadius: BorderRadius.circular(
        const_measures.borderRadius,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.monza,
      ),
      borderRadius: BorderRadius.circular(
        const_measures.borderRadius,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(_textTheme.button),
      foregroundColor: MaterialStateProperty.all(const_colors.white),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return const_colors.silverChalice;
          }
          return const_colors.plainOcean;
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            const_measures.borderRadius,
          ),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: _buttonVerPadding,
        ),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: const_colors.white,
    elevation: 4,
    selectedIconTheme: IconThemeData(
      color: const_colors.plainOcean,
      size: _bottomNavBarIconSize,
    ),
    unselectedIconTheme: IconThemeData(
      color: const_colors.silverChalice,
      size: _bottomNavBarIconSize,
    ),
  ),
  iconTheme: const IconThemeData(
    color: const_colors.corn,
  ),
);

const _textTheme = TextTheme(
  headline3: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: const_colors.mineShaft,
  ),
  headline4: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: const_colors.mineShaft,
  ),
  headline5: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: const_colors.mineShaft,
  ),
  headline6: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const_colors.white,
  ),
  bodyText1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const_colors.mineShaft,
  ),
  bodyText2: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: const_colors.mineShaft,
  ),
  subtitle1: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const_colors.silverChalice,
  ),
  subtitle2: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const_colors.mineShaft,
  ),
  button: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const_colors.white,
  ),
);
