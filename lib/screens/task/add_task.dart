import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/utilities/database_helper.dart';
import 'package:yaplist/widgets/bottom/date_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
  }

  onDateChanged(DateTime newDate) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(newDate);
    dateController.text = formattedDate;
    selectedDate = newDate;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("addTask"),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InputField(
                      label: tr("task"),
                      controller: titleController,
                      icon: Icons.task,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return tr("pleaseEnterTask");
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      label: tr("category"),
                      icon: Icons.category,
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      label: tr("selectDate"),
                      onTap: () {
                        DatePickerModal.show(
                            context: context, onDateTimeChanged: onDateChanged);
                      },
                      controller: dateController,
                      readOnly: true,
                      icon: Icons.date_range,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4),
                child: MasterButton(
                  label: tr("add"),
                  icon: Icons.calendar_month,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Task task = Task(
                        id: DatabaseHelper.generateUniqueId(),
                        title: titleController.text,
                      );
                      context.read<TaskBloc>().add(AddTask(task: task));
                      Navigator.maybePop(context);
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
