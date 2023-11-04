import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/utilities/database_helper.dart';

class CategoryManager {
  static void addCategory(
      {required BuildContext context,
      required String name,
      required Color? color}) {
    Category category = Category(
        id: DatabaseHelper.generateUniqueId(), name: name, color: color);

    BlocProvider.of<CategoryBloc>(context).add(AddCategory(category: category));
  }

  static void updateCategory({
    required BuildContext context,
    required Category category,
  }) {
    BlocProvider.of<CategoryBloc>(context)
        .add(UpdateCategory(category: category));
    _updateTasks(category: category, context: context, newCategory: category);
  }

  static void deleteCategory({
    required BuildContext context,
    required Category category,
  }) {
    BlocProvider.of<CategoryBloc>(context)
        .add(DeleteCategory(category: category));
    _updateTasks(category: category, context: context, newCategory: null);
  }

  static _updateTasks({
    required BuildContext context,
    required Category category,
    required Category? newCategory,
  }) {
    BlocProvider.of<TaskBloc>(context).add(
      BulkUpdateTask(
          category: newCategory,
          tasklist:
              getTaskListFromCategory(category: category, context: context)),
    );
  }

  static List<Task> getTaskListFromCategory({
    required BuildContext context,
    required Category category,
  }) {
    List<Task> tasklist = BlocProvider.of<TaskBloc>(context)
        .state
        .taskList
        .where((element) => element.category?.id == category.id)
        .toList();
    return tasklist;
  }
}
