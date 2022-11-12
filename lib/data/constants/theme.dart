import 'package:flutter/material.dart';

const Color kAppColor = Colors.indigoAccent;
const kScaffoldColor = Colors.white;

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kAppColor,
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: _createMaterialColor(kAppColor),
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  iconTheme: const IconThemeData(color: Colors.grey),
  bottomSheetTheme: const BottomSheetThemeData(
    modalBackgroundColor: Colors.white,
  ),
);

MaterialColor _createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

Color darkenColor(Color c, [int percent = 15]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(
    c.alpha,
    (c.red * f).round(),
    (c.green * f).round(),
    (c.blue * f).round(),
  );
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lightenColor(Color c, [int percent = 15]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
    c.alpha,
    c.red + ((255 - c.red) * p).round(),
    c.green + ((255 - c.green) * p).round(),
    c.blue + ((255 - c.blue) * p).round(),
  );
}
