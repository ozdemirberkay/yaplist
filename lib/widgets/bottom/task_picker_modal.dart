import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/widgets/builder/task_builder.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class TaskPickerModal extends StatelessWidget {
  final Function(Task) onTaskSelected;
  const TaskPickerModal({super.key, required this.onTaskSelected});

  static void show(
      {required BuildContext context, required Function(Task) onTaskSelected}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return TaskPickerModal(
          onTaskSelected: onTaskSelected,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ModalLabel(label: tr("chooseTask")),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: TaskBuilder(
                onTaskSelected: (task) {
                  onTaskSelected(task);
                  Navigator.pop(context);
                },
                disableTaskOperations: true,
                taskFilter: TaskFilter(
                  completedDropdownModel: CompletedDropdownModel(
                      title: tr("incomplete"), data: false),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
