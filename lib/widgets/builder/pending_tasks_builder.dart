import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/widgets/card/task_card.dart';

class PendingTasksBuilder extends StatelessWidget with TaskFilterMixin {
  const PendingTasksBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final List<Task> pendingTasks = pendingMaxThreeTask(
          taskList: state.taskList,
        );

        if (pendingTasks.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('pendingTasks'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              ...pendingTasks.map((task) => TaskCard(task: task)),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
