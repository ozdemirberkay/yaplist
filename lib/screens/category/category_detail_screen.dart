import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/screens/category/category_manager_screen.dart';
import 'package:yaplist/screens/task/task_manager_screen.dart';
import 'package:yaplist/widgets/builder/task_builder.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: TaskBuilder(
        taskFilter: TaskFilter(category: category),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoryManagerScreen(
                category: category,
              ),
            ));
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TaskManagerScreen(
                defaultCategory: category,
              ),
            ));
          },
          icon: const Icon(Icons.add),
        ),
      ],
      title: category.name,
    );
  }
}
