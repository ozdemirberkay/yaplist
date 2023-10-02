import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/widgets/card/task_card.dart';

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.taskList;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: taskList.length,
          itemBuilder: (context, index) => TaskCard(
            task: taskList[index],
          ),
        );
      },
    );
  }
}
