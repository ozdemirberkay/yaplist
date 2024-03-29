import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColorLight = const Color(0xff000000);
  static Color primaryColorDark = const Color(0xffffffff);
  static Color greyColor = Colors.grey;
  static Color redColor = Colors.red;

  static Color reversePrimaryColor(ThemeData themeData) {
    return themeData.brightness == Brightness.dark
        ? primaryColorLight
        : primaryColorDark;
  }

  static List<ColorSwatch> materialColors = <ColorSwatch>[
    const ColorSwatch(
      0xFFFFFFFF,
      <int, Color>{
        50: Color(0xFFFFFFFF),
        100: Color(0xFFFAFAFA),
        200: Color(0xFFF5F5F5),
        300: Color(0xFFE8E8E8),
        400: Color(0xFFD3D3D3),
        500: Color(0xFFC2C2C2),
        600: Color(0xFFA3A3A3),
        700: Color(0xFF7A7A7A),
        800: Color(0xFF525252),
        900: Color(0xFF000000),
      },
    ),
    Colors.red,
    Colors.redAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.cyan,
    Colors.cyanAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.yellow,
    Colors.yellowAccent,
    Colors.amber,
    Colors.amberAccent,
    Colors.orange,
    Colors.orangeAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    const ColorSwatch(
      0xFF000000,
      <int, Color>{
        50: Color(0xFFFFFFFF),
        100: Color(0xFFFAFAFA),
        200: Color(0xFFF5F5F5),
        300: Color(0xFFE8E8E8),
        400: Color(0xFFD3D3D3),
        500: Color(0xFFC2C2C2),
        600: Color(0xFFA3A3A3),
        700: Color(0xFF7A7A7A),
        800: Color(0xFF525252),
        900: Color(0xFF000000),
      },
    ),
  ];
}
