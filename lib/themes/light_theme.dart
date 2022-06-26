import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;

const _borderRadius = 8.0;
const _buttonVerPadding = 21.0;
const _bottomNavBarIconSize = 24.0;
const _iconSize = 12.5;

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const_colors.white,
  hintColor: const_colors.silverChalice,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: _textTheme.subtitle1,
    errorStyle: const TextStyle(
      color: const_colors.monza,
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.gallery,
      ),
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.gallery,
      ),
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.plainOcean,
      ),
      borderRadius: BorderRadius.circular(_borderRadius),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: const_colors.monza,
      ),
      borderRadius: BorderRadius.circular(_borderRadius),
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
          borderRadius: BorderRadius.circular(_borderRadius),
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
    size: _iconSize,
  ),
  textTheme: _textTheme,
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
    color: const_colors.mineShaft,
  ),
  bodyText1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const_colors.white,
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
