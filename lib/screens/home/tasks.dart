import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/bottom/task_filter_modal.dart';
import 'package:yaplist/widgets/builder/task_builder.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("tasks"),
      body: const TaskBuilder(),
      actions: [
        IconButton(
          onPressed: () {
            TaskFilterModal.show(context: context);
          },
          icon: const Icon(Icons.filter_alt_outlined),
        )
      ],
    );
  }
}
