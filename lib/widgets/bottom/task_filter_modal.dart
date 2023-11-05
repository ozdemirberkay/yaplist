import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class TaskFilterModal extends StatelessWidget {
  const TaskFilterModal({super.key});

  static void show({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const TaskFilterModal();
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
              //TODO input alanları ekle
              ModalLabel(label: tr("selectDate")),
              const SizedBox(height: 6),
            ],
          );
        },
      ),
    );
  }
}
