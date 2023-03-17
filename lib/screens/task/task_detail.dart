import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/todo_bloc.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task? task;
  const TaskDetailScreen({super.key, this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  void showDatePicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime newDate) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(newDate);
                      dateController.text = formattedDate;
                      selectedDate = newDate;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: MasterButtonIcon(
                      label: tr("select"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.check),
                )
              ],
            ),
          );
        });
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
              icon: Icons.task,
            ),
            const SizedBox(height: 10),
            const InputField(
              label: "Deneme123",
            ),
            const SizedBox(height: 10),
            InputField(
              label: tr("selectDate"),
              onTap: showDatePicker,
              controller: dateController,
              readOnly: true,
              icon: Icons.date_range,
            ),
            const SizedBox(height: 10),
            MasterButtonIcon(
              label: tr("add"),
              icon: Icons.calendar_month,
              onPressed: () {
                Task task = Task(
                  id: 1,
                  title: taskController.text,
                  isCompleted: false,
                );
                context.read<TodoBloc>().add(AddTask(task: task));
              },
            ),
          ],
        ),
      ),
    );
  }
}
