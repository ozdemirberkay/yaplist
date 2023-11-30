import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/ads/ads_manager.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/widgets/builder/empty/empty_task_builder.dart';
import 'package:yaplist/widgets/card/task_card.dart';

class TaskBuilder extends StatelessWidget with TaskFilterMixin {
  final TaskFilter? taskFilter;
  const TaskBuilder({super.key, this.taskFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          List<Task> taskList = state.taskList;
          if (taskFilter != null) {
            taskList =
                filteredTaskList(taskList: taskList, filter: taskFilter!);
          }
          if (taskList.isEmpty) {
            return const EmptyTaskBuilder();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: taskList.length + 1,
            itemBuilder: (context, index) {
              if (index == taskList.length) {
                return BannerAdManager.instance.loadAndShowAd();
              }
              return TaskCard(
                task: taskList[index],
              );
            },
          );
        },
      ),
    );
  }
}
