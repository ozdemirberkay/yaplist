import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';

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
            //TODO colorsları appcolorsa ekle
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              icon: Icons.info,
              label: tr("details"),
            ),
            SlidableAction(
              onPressed: deleteTask,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete_forever,
              label: tr("delete"),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(),
            ),
            color: task.category?.color,
          ),
          child: Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  task.isCompleted = value!;
                  context.read<TaskBloc>().add(UpdateTask(task: task));
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
