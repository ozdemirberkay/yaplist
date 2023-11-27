import 'package:easy_localization/easy_localization.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/shareds/constants/routes.dart';

class _QuickActionManager {
  static void initialize({required Function(String) handler}) {
    QuickActions quickActions = const QuickActions();

    final ShortcutItem addTaskShortcutItem = ShortcutItem(
        type: Routes.taskManager, localizedTitle: tr("addTask"), icon: "task");
    final ShortcutItem addCategoryShortcutItem = ShortcutItem(
        type: Routes.categoryManager,
        localizedTitle: tr("addCategory"),
        icon: "category");
    quickActions
        .setShortcutItems([addTaskShortcutItem, addCategoryShortcutItem]);
    quickActions.initialize(handler);
  }
}

class QuickActionsManagerScreen extends StatefulWidget {
  final Widget child;
  const QuickActionsManagerScreen({super.key, required this.child});

  @override
  State<QuickActionsManagerScreen> createState() =>
      _QuickActionsManagerScreenState();
}

class _QuickActionsManagerScreenState extends State<QuickActionsManagerScreen> {
  @override
  void initState() {
    _QuickActionManager.initialize(handler: (String type) {
      Navigator.pushNamed(context, type);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
