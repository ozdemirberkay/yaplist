import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
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
  }

  static void deleteCategory({
    required BuildContext context,
    required Category category,
  }) {
    BlocProvider.of<CategoryBloc>(context)
        .add(DeleteCategory(category: category));
  }
}
