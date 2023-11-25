import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/yap_list_icon_icons.dart';

class HomeIcon extends StatelessWidget {
  final double size;
  const HomeIcon({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Icon(YapListIcon.yaplist, size: size);
  }
}
