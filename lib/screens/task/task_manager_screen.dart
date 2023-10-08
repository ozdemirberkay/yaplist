
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/utilities/date/date_helper.dart';
import 'package:yaplist/utilities/task_manager.dart';
import 'package:yaplist/widgets/bottom/category_picker_modal.dart';
import 'package:yaplist/widgets/bottom/date_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';
import 'package:yaplist/models/category.dart';

class TaskManagerScreen extends StatefulWidget {
  final Task? task;
  const TaskManagerScreen({super.key, this.task});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController categoryController;
  DateTime? selectedDate;
  Category? selectedCategory;
  bool haveTask = false;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.task?.title);
    dateController =
        TextEditingController(text: DateHelper.formatDate(widget.task?.date));
    categoryController =
        TextEditingController(text: widget.task?.category?.name);
    super.initState();
    selectedCategory = widget.task?.category;
    selectedDate = widget.task?.date;
    haveTask = widget.task != null;
  }

  void onDateChanged(DateTime newDate) {
    dateController.text = DateHelper.formatDate(newDate);
    selectedDate = newDate;
  }

  void onCategorySelected(Category newCategory) {
    categoryController.text = newCategory.name;
    setState(() {
      selectedCategory = newCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("task"),
      actions: [
        if (haveTask)
          IconButton(
              onPressed: () {
                TaskManager.deleteTask(context: context, task: widget.task!);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_forever))
      ],
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
                      maxLines: 5,
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
                      fillColor: selectedCategory?.color,
                      controller: categoryController,
                      onTap: () {
                        CategoryPickerModal.show(
                            context: context,
                            onCategorySelected: onCategorySelected);
                      },
                      readOnly: true,
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      label: tr("date"),
                      onTap: () {
                        DatePickerModal.show(
                            context: context,
                            onDateTimeChanged: onDateChanged,
                            initialDate: selectedDate);
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
                  label: haveTask ? tr("update") : tr("add"),
                  icon: Icons.calendar_month,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (haveTask) {
                        TaskManager.addTask(
                            context: context,
                            title: titleController.text,
                            category: selectedCategory,
                            date: selectedDate);
                      }

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
