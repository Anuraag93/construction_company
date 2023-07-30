import 'package:construction_company/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor.lightColor,
    colorScheme: _getAppColorScheme(Brightness.light),
    appBarTheme: _appBarThemeData(Brightness.light),
    dividerColor: AppColors.dividerColor.lightColor,
    disabledColor: AppColors.groundColor.lightColor?.withOpacity(0.5),
    shadowColor: AppColors.groundColor.lightColor?.withOpacity(0.5),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor.darkColor,
    colorScheme: _getAppColorScheme(Brightness.dark),
    appBarTheme: _appBarThemeData(Brightness.dark),
    dividerColor: AppColors.dividerColor.darkColor,
    disabledColor: AppColors.groundColor.darkColor?.withOpacity(0.5),
    shadowColor: AppColors.groundColor.darkColor?.withOpacity(0.5),
  );

  static ColorScheme _getAppColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: AppColors.primaryColor[brightness]!,
      onPrimary: AppColors.onPrimaryColor[brightness]!,
      secondary: AppColors.secondaryColor[brightness]!,
      onSecondary: AppColors.onSecondaryColor[brightness]!,
      error: AppColors.errorColor[brightness]!,
      onError: AppColors.onErrorColor[brightness]!,
      background: AppColors.backgroundColor[brightness]!,
      onBackground: AppColors.onBackgroundColor[brightness]!,
      surface: AppColors.surfaceColor[brightness]!,
      onSurface: AppColors.onSurfaceColor[brightness]!,
    );
  }

  static AppBarTheme _appBarThemeData(Brightness brightness) {
    return AppBarTheme(
        backgroundColor: AppColors.primaryColor[brightness],
        iconTheme: IconThemeData(color: AppColors.onPrimaryColor[brightness]),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: brightness,
            statusBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarColor: Colors.transparent));
  }
}
