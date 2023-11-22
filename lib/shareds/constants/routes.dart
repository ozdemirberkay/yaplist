import 'package:flutter/material.dart';
import 'package:yaplist/screens/category/category_manager_screen.dart';
import 'package:yaplist/screens/dashboard/dashboard_screen.dart';
import 'package:yaplist/screens/task/task_manager_screen.dart';

class Routes {
  static String initialScreen = '/';
  static String taskManager = '/taskManager';
  static String categoryManager = '/categoryManager';

  static Map<String, WidgetBuilder> routes = {
    initialScreen: (context) => const DashboardScreeen(),
    taskManager: (context) => const TaskManagerScreen(),
    categoryManager: (context) => const CategoryManagerScreen(),
  };
}
