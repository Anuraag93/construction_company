import 'package:flutter/material.dart';

class AppColors {
  static const Color _primaryColor = Color(0xFF000000);
  static const Color _surfaceColor = Color(0xFFFFFFFF);
  static const Color _accentColor = Color(0xFF97d600);
  static const Color _backgroundColor = Color(0xFFF1F5F7);
  static const Color _groundGrey = Color(0xFF333333);

  static final Map<Brightness, Color> primaryColor =
      _buildColor(lightColor: _primaryColor, darkColor: _primaryColor);

  static final Map<Brightness, Color> onPrimaryColor =
      _buildColor(lightColor: Colors.white, darkColor: Colors.white);

  static final Map<Brightness, Color> secondaryColor =
      _buildColor(lightColor: _accentColor, darkColor: _accentColor);

  static final Map<Brightness, Color> onSecondaryColor =
      _buildColor(lightColor: Colors.white, darkColor: Colors.white);

  static final Map<Brightness, Color> errorColor =
      _buildColor(lightColor: Colors.red, darkColor: Colors.red);

  static final Map<Brightness, Color> onErrorColor =
      _buildColor(lightColor: Colors.red, darkColor: Colors.red);

  static final Map<Brightness, Color> backgroundColor =
      _buildColor(lightColor: _backgroundColor, darkColor: _backgroundColor);

  static final Map<Brightness, Color> onBackgroundColor =
      _buildColor(lightColor: Colors.black, darkColor: Colors.black);

  static final Map<Brightness, Color> surfaceColor =
      _buildColor(lightColor: _surfaceColor, darkColor: _surfaceColor);

  static final Map<Brightness, Color> onSurfaceColor =
      _buildColor(lightColor: Colors.grey, darkColor: Colors.grey);

  static final Map<Brightness, Color> dividerColor = _buildColor(
      lightColor: _groundGrey.withOpacity(0.33),
      darkColor: _groundGrey.withOpacity(0.33));

  static final Map<Brightness, Color> groundColor =
      _buildColor(lightColor: _groundGrey, darkColor: _groundGrey);

  static Map<Brightness, Color> _buildColor(
      {required Color lightColor, required Color darkColor}) {
    final Map<Brightness, Color> colorMap = {};

    colorMap.putIfAbsent(Brightness.light, () => lightColor);
    colorMap.putIfAbsent(Brightness.dark, () => darkColor);

    return colorMap;
  }
}

extension ColorMap on Map<Brightness, Color> {
  Color? get lightColor => this[Brightness.light];

  Color? get darkColor => this[Brightness.dark];

  Color? platformBrightnessColor(BuildContext context) {
    // We need to check the theme mode to be able disable dark mode completely.
    // Indeed, Platform.brightness will still be `dark` even if we force the ThemeMode to be `light` in the MaterialApp.
    final ThemeMode themeMode =
        context.findAncestorWidgetOfExactType<MaterialApp>()?.themeMode ??
            ThemeMode.system;
    final Brightness brightness;

    switch (themeMode) {
      case ThemeMode.system:
        brightness = MediaQuery.of(context).platformBrightness;
        break;
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
    }

    return this[brightness];
  }
}
