import 'package:flutter/material.dart';
import 'package:yaplist/screens/category/add_category.dart';
import 'package:yaplist/screens/dashboard/dashboard_screen.dart';
import 'package:yaplist/screens/search/search_screen.dart';
import 'package:yaplist/screens/task/add_task.dart';

class Routes {
  static String initialScreen = '/';
  static String addTask = '/addTask';
  static String searchScreen = '/searchScreen';
  static String addCateogry = '/addCateogry';

  static Map<String, WidgetBuilder> routes = {
    initialScreen: (context) => const DashboardScreeen(),
    addTask: (context) => const AddTaskScreen(),
    searchScreen: (context) => const SearchScreen(),
    addCateogry: (context) => const AddCategoryScreen(),
  };
}
