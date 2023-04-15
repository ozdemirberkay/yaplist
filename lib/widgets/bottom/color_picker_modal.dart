import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/card/color_card.dart';

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

  setSelectedColor(Color clickedColor) {
    setState(() {
      selectedColor = clickedColor;
    });
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
                        selected:
                            selectedColor == AppColors.materialColors[index],
                        onColorSelected: setSelectedColor,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: MasterButton(
                    disabled: selectedColor == null,
                    label: tr("select"),
                    onPressed: () {
                      widget.onColorSelected(selectedColor);
                      Navigator.of(context).pop();
                    },
                    icon: Icons.check),
              )
            ],
          );
        },
      ),
    );
  }
}
