import 'package:flutter/material.dart';
import 'package:yaplist/screens/dashboard/dashboard_screen.dart';
import 'package:yaplist/screens/search/search_screen.dart';
import 'package:yaplist/screens/task/add_task.dart';

class Routes {
  static String initialScreen = '/';
  static String addScreen = '/addScreen';
  static String searchScreen = '/searchScreen';

  static Map<String, WidgetBuilder> routes = {
    initialScreen: (context) => const DashboardScreeen(),
    addScreen: (context) => const AddTask(),
    searchScreen: (context) => const SearchScreen(),
  };
}
