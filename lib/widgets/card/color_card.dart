import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';

class ColorCard extends StatelessWidget {
  final Color color;
  final bool selected;
  const ColorCard({super.key, required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: Constants.borderRadius,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      height: 40,
      child: selected ? const Icon(Icons.check) : const SizedBox(),
    );
  }
}
