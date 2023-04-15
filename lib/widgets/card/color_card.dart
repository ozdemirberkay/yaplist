import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';

class ColorCard extends StatelessWidget {
  final Color color;
  final bool selected;
  final Function(Color) onColorSelected;
  const ColorCard(
      {super.key,
      required this.color,
      required this.selected,
      required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onColorSelected(color);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
          borderRadius: Constants.borderRadius,
          color: color,
          boxShadow: [
            //TODO colorsları appcolorsa ekle

            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        height: 40,
        child: selected
            ? Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.selectedGreenColor,
                    borderRadius: Constants.borderRadius,
                  ),
                  child: const Icon(Icons.check),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
