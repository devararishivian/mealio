import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  PRO,
}

class Config {
  static Flavor appFlavor;

  static String get appString {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Mealio DEVELOPMENT';
        break;
      case Flavor.PRO:
        return 'Mealio PRODUCTION';
        break;
      default:
        return 'Mealio';
        break;
    }
  }

  static ThemeData get appTheme {
    switch (appFlavor) {
      case Flavor.DEV:
        return ThemeData.light();
        break;
      case Flavor.PRO:
        return ThemeData.dark();
        break;
      default:
        return ThemeData.dark();
        break;
    }
  }
}
