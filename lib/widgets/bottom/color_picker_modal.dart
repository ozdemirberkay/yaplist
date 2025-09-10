import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';
import 'package:yaplist/widgets/card/color_card.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class ColorPickerModal extends StatefulWidget {
  final Function(Color?) onColorSelected;

  const ColorPickerModal({super.key, required this.onColorSelected});

  static void show(
      {required BuildContext context,
      required Function(Color?) onColorSelected}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ColorPickerModal(
            onColorSelected: onColorSelected,
          );
        });
  }

  @override
  State<ColorPickerModal> createState() => _ColorPickerModalState();
}

class _ColorPickerModalState extends State<ColorPickerModal> {
  Color? selectedColor;

  void setSelectedColor(Color clickedColor) {
    widget.onColorSelected(clickedColor);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              ModalLabel(label: tr("chooseColor")),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: AppColors.materialColors.length,
                    itemBuilder: (context, index) {
                      return ColorCard(
                        color: AppColors.materialColors[index],
                        onColorSelected: setSelectedColor,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          );
        },
      ),
    );
  }
}
