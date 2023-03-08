import 'package:flutter/material.dart';
import 'package:yaplist/screens/dashboard/dashboard_screen.dart';
import 'package:yaplist/screens/search/search_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const DashboardScreeen(),
    '/addScreen': (context) => const DashboardScreeen(),
    '/searchScreen': (context) => const SearchScreen(),
  };
}
