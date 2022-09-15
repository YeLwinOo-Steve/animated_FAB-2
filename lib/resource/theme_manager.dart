import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: ColorManager.white,
      foregroundColor: ColorManager.primary,
      titleTextStyle: TextStyle(
        color: ColorManager.black,
        fontSize: 24,
        fontWeight: FontWeightManager.semibold,
      ),
    ),
  );
}
