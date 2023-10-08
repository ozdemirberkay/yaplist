import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/utilities/database_helper.dart';

class TaskManager {
  static void addTask(
      {required BuildContext context,
      required String title,
      required Category? category,
      required DateTime? date}) {
    Task task = Task(
      id: DatabaseHelper.generateUniqueId(),
      title: title,
      category: category,
      date: date,
    );

    BlocProvider.of<TaskBloc>(context).add(AddTask(task: task));
  }

  static void updateTask({
    required BuildContext context,
    required Task task,
  }) {
    BlocProvider.of<TaskBloc>(context).add(UpdateTask(task: task));
  }

  static void deleteTask({
    required BuildContext context,
    required Task task,
  }) {
    BlocProvider.of<TaskBloc>(context).add(DeleteTask(task: task));
  }
}
