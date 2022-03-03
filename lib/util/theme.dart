import 'package:flutter/material.dart';

final ThemeData hxThemeData =  ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    accentColor: HxColors.hxBlue[500],
    accentColorBrightness: Brightness.light
);

class HxColors {
  HxColors._();

  static const _hxPrimaryValue = 0xFF088CCC;

  static const MaterialColor hxBlue =  MaterialColor(
    _hxPrimaryValue,
     <int, Color>{
      50:   Color(0xFFE7f6FE),
      100:  Color(0xFFB6E4FC),
      200:  Color(0xFF85D3FA),
      300:  Color(0xFF54C1F8),
      400:  Color(0xFF23AFF6),
      500:  Color(_hxPrimaryValue),
      600:  Color(0xFF23AFF6),
      700:  Color(0xFF0775AB),
      800:  Color(0xFF05537A),
      900:  Color(0xFF033249),
    },
  );
}