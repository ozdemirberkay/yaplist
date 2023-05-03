import 'package:flutter/material.dart';

class Constants {
  static BorderRadiusGeometry borderRadius = BorderRadius.circular(5);

  //TODO colorsları appcolorsa ekle
  static BoxShadow shadow = BoxShadow(
    color: Colors.grey.withOpacity(0.7),
    offset: const Offset(0, 2),
    blurRadius: 2,
  );
}
