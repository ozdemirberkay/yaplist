import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/drawer/widget/language_changer_button.dart';
import 'package:yaplist/widgets/drawer/widget/theme_changer_button.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<bool?> _showConfirmDialog(BuildContext context, String message) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('confirm')),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(tr('cancel')),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(tr('delete')),
          ),
        ],
      ),
    );
  }

  void _deleteCompletedTasks(BuildContext context) async {
    final confirmed = await _showConfirmDialog(
      context,
      tr('deleteCompletedTasksConfirm'),
    );
    if (confirmed == true && context.mounted) {
      context.read<TaskBloc>().add(DeleteCompletedTasks());
    }
  }

  void _deleteAllData(BuildContext context) async {
    final confirmed = await _showConfirmDialog(
      context,
      tr('deleteAllDataConfirm'),
    );
    if (confirmed == true && context.mounted) {
      context.read<TaskBloc>().add(DeleteAllTasks());
      context.read<CategoryBloc>().add(DeleteAllCategories());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr('settings'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          const ThemeChangerButton(),
          const SizedBox(height: 8),
          const LanguageChangerButton(),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: MasterButton(
              label: tr('deleteCompletedTasks'),
              icon: Icons.done_all,
              onPressed: () => _deleteCompletedTasks(context),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: MasterButton(
              label: tr('deleteAllData'),
              icon: Icons.delete_sweep,
              onPressed: () => _deleteAllData(context),
            ),
          ),
        ],
      ),
    );
  }
}
