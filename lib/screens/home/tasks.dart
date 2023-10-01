import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/widgets/card/task_card.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.taskList;

        return Layout(
          title: tr("tasks"),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: taskList.length,
              itemBuilder: (context, index) => TaskCard(
                task: taskList[index],
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt_outlined),
            )
          ],
        );
      },
    );
  }
}
