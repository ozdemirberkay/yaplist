import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/widgets/bottom/task_filter_modal.dart';
import 'package:yaplist/widgets/builder/task_builder.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  TaskFilter? taskFilter;

  void onFilterChanged(TaskFilter? newTaskFilter) {
    setState(() {
      taskFilter = newTaskFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("tasks"),
      body: TaskBuilder(
        taskFilter: taskFilter,
      ),
      actions: [
        IconButton(
          onPressed: () {
            TaskFilterModal.show(
                taskFilter: taskFilter,
                context: context,
                onFilterChanged: onFilterChanged);
          },
          icon: Icon(taskFilter != null
              ? Icons.filter_alt
              : Icons.filter_alt_outlined),
        )
      ],
    );
  }
}
