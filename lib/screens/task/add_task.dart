import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/todo_bloc.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskController = TextEditingController();

  DateTime date = DateTime(2016, 10, 26);

  void _showDialog() {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  initialDateTime: date,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  // This is called when the user changes the date.
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() => date = newDate);
                  },
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("addTask"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              label: tr("task"),
              controller: taskController,
              icon: Icons.task_outlined,
            ),
            const SizedBox(height: 10),
            const InputField(
              label: "Deneme123",
            ),
            const SizedBox(height: 10),
            MasterButtonIcon(
              label: tr("add"),
              icon: Icons.check,
              onPressed: () {
                Task task =
                    Task(id: 1, title: taskController.text, isCompleted: false);
                context.read<TodoBloc>().add(AddTask(task: task));
              },
            ),
          ],
        ),
      ),
    );
  }
}
