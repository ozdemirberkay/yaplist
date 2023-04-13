import 'package:flutter/material.dart';
import 'package:yaplist/screens/category/category_detail.dart';
import 'package:yaplist/screens/dashboard/dashboard_screen.dart';
import 'package:yaplist/screens/search/search_screen.dart';
import 'package:yaplist/screens/task/task_detail.dart';

class Routes {
  static String initialScreen = '/';
  static String addTask = '/addTask';
  static String searchScreen = '/searchScreen';
  static String addCateogry = '/addCateogry';

  static Map<String, WidgetBuilder> routes = {
    initialScreen: (context) => const DashboardScreeen(),
    addTask: (context) => const TaskDetailScreen(),
    searchScreen: (context) => const SearchScreen(),
    addCateogry: (context) => const CategoryDetailScreen(),
  };
}
