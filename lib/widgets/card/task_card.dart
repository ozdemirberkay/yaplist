import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/screens/task/task_manager_screen.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';
import 'package:yaplist/utilities/task_manager.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  void deleteTask(BuildContext context) {
    context.read<TaskBloc>().add(DeleteTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Slidable(
        key: ValueKey(task.id),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TaskManagerScreen(task: task)));
              },
              backgroundColor: AppColors.greyColor,
              foregroundColor: AppColors.reversePrimaryColor(Theme.of(context)),
              icon: Icons.info,
              label: tr("details"),
            ),
            SlidableAction(
              onPressed: deleteTask,
              backgroundColor: AppColors.redColor,
              foregroundColor: AppColors.reversePrimaryColor(Theme.of(context)),
              icon: Icons.delete_forever,
              label: tr("delete"),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).primaryColor),
            ),
            color: task.category?.color,
          ),
          child: Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  task.isCompleted = value!;
                  TaskManager.updateTask(context: context, task: task);
                },
                value: task.isCompleted,
              ),
              Expanded(
                child: Text(
                  task.title,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
