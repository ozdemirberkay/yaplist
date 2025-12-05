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
    final categoryColor =
        task.category?.color ?? Theme.of(context).primaryColor;
    const double borderWidthValue = 2;

    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: task.category?.color ?? Theme.of(context).primaryColor,
            width: borderWidthValue,
          ),
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
          child: Padding(
            padding: const EdgeInsets.all(6),
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        if (task.category != null || task.date != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (task.category != null)
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: categoryColor.withAlpha(30),
                                          borderRadius: Constants.borderRadius),
                                      child: Text(
                                        task.category!.name,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: categoryColor,
                                        ),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                if (task.category != null && task.date != null)
                                  const SizedBox(width: 8),
                                if (task.date != null)
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_outlined,
                                          size: 12,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.color),
                                      const SizedBox(width: 4),
                                      Text(
                                        DateFormat('dd MMM').format(task.date!),
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.color),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                      ],
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
