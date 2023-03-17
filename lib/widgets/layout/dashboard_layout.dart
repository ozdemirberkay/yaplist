import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/screens/task/task_detail.dart';

class DashboardLayout extends StatelessWidget {
  final Widget body;
  final int index;
  final Function(int) onChanged;

  const DashboardLayout({
    required this.body,
    required this.index,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TaskDetailScreen(),
          ));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: tr("homePage"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.bar_chart),
          label: tr("statistics"),
        ),
      ], currentIndex: index, onTap: onChanged),
      body: body,
    );
  }
}
