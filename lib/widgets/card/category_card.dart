import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';

class CategoryCard extends StatefulWidget {
  final Task task;
  const CategoryCard({super.key, required this.task});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  void deleteTask(BuildContext context) {
    context.read<TaskBloc>().add(DeleteTask(task: widget.task));
  }

  void updateTask(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.task.id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
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
            color: Theme.of(context).scaffoldBackgroundColor,
            border: const Border.symmetric(
              horizontal: BorderSide(color: Colors.grey),
            )
            // border: Border.all(color: Colors.pink),
            ),
        child: Column(
          children: [
            Text(
              widget.task.title,
            ),
          ],
        ),
      ),
    );
  }
}
