import 'package:flutter/material.dart';
import 'package:yaplist/screens/home/home_page.dart';
import 'package:yaplist/screens/home/tasks.dart';
import 'package:yaplist/shareds/quick_actions/quick_actions_manager.dart';
import 'package:yaplist/widgets/layout/dashboard_layout.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  Widget _dashboardBody() {
    if (_selectedIndex == 0) {
      return const HomePage();
    } else if (_selectedIndex == 1) {
      return const Tasks();
    }
    return Container();
  }

  void onChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return QuickActionsManagerScreen(
      child: DashboardLayout(
        body: _dashboardBody(),
        index: _selectedIndex,
        onChanged: onChanged,
      ),
    );
  }
}
