import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_button.dart';
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
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tr("taskNotFound"), textAlign: TextAlign.center),
                    const SizedBox(height: 6),
                    MasterButton(
                        label: tr("addTask"),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.taskManager);
                        },
                        icon: Icons.add),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: taskList.length,
            itemBuilder: (context, index) => TaskCard(
              task: taskList[index],
            ),
          );
        },
      ),
    );
  }
}
