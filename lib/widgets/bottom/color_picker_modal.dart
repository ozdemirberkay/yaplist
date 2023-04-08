import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/constants.dart';

class ColorPickerModal extends StatelessWidget {
  final Function(Color) onColorSelected;

  const ColorPickerModal({super.key, required this.onColorSelected});

  static void show(
      {required BuildContext context,
      required Function(Color) onColorSelected}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: Constants.borderRadius,
        ),
        context: context,
        builder: (context) {
          return ColorPickerModal(
            onColorSelected: onColorSelected,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
