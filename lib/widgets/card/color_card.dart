import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final Color color;
  final Function(Color) onColorSelected;
  const ColorCard(
      {super.key, required this.color, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onColorSelected(color);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
          color: color,
        ),
        height: 45,
      ),
    );
  }
}
