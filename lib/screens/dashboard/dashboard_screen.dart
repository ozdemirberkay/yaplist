import 'package:flutter/material.dart';
import 'package:yaplist/screens/home_page.dart';
import 'package:yaplist/widgets/layout/dashboard_layout.dart';

class DashboardScreeen extends StatefulWidget {
  const DashboardScreeen({super.key});

  @override
  State<DashboardScreeen> createState() => _DashboardScreeenState();
}

class _DashboardScreeenState extends State<DashboardScreeen> {
  int _selectedIndex = 0;

  Widget _dashboardBody() {
    if (_selectedIndex == 0) {
      return const HomePage();
    } else if (_selectedIndex == 1) {
    } else if (_selectedIndex == 2) {}
    return Container();
  }

  void onChanged(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      body: _dashboardBody(),
      index: _selectedIndex,
      onChanged: onChanged,
    );
  }
}
