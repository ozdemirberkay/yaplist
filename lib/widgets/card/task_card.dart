import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/screens/task/task_manager_screen.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';
import 'package:yaplist/utilities/state_operations/task_manager.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final bool disableTaskOperations;
  final Function(Task)? onTaskSelected;

  const TaskCard(
      {super.key,
      required this.task,
      this.onTaskSelected,
      this.disableTaskOperations = false});

  void deleteTask(BuildContext context) {
    TaskManager.deleteTask(context: context, task: task);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: Constants.borderRadius,
        border: Border.all(
          color: task.category?.color ?? Theme.of(context).primaryColor,
        ),
      ),
      child: InkWell(
        onTap: onTaskSelected != null ? () => onTaskSelected!(task) : null,
        child: Slidable(
          key: ValueKey(task.id),
          enabled: !disableTaskOperations,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TaskManagerScreen(task: task)));
                },
                backgroundColor: AppColors.greyColor,
                foregroundColor:
                    AppColors.reversePrimaryColor(Theme.of(context)),
                icon: Icons.info,
                label: tr("detail"),
              ),
              SlidableAction(
                onPressed: deleteTask,
                backgroundColor: AppColors.redColor,
                foregroundColor:
                    AppColors.reversePrimaryColor(Theme.of(context)),
                icon: Icons.delete_forever,
                label: tr("delete"),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: Constants.borderRadius,
              border: Border(
                left: BorderSide(
                  color: task.category?.color ?? Theme.of(context).primaryColor,
                  width: 8,
                ),
              ),
            ),
            child: Row(
              children: [
                if (!disableTaskOperations)
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      task.isCompleted = value!;
                      TaskManager.updateTask(context: context, task: task);
                    },
                    value: task.isCompleted,
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      task.title,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
