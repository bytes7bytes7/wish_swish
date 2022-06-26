import 'package:flutter/material.dart';

import '../constants/colors.dart' as const_colors;

const _borderRadius = 8.0;
const _buttonVerPadding = 21.0;
const _iconSize = 24.0;

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
      size: _iconSize,
    ),
    unselectedIconTheme: IconThemeData(
      color: const_colors.silverChalice,
      size: _iconSize,
    ),
  ),
  textTheme: _textTheme,
);

const _textTheme = TextTheme(
  headline3: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  headline4: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
  headline5: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  headline6: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyText1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  bodyText2: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  ),
  subtitle1: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  subtitle2: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
);
