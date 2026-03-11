import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';
import 'package:yaplist/models/priority.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/constants/constants.dart';
import 'package:yaplist/utilities/date/date_helper.dart';
import 'package:yaplist/utilities/state_operations/task_manager.dart';
import 'package:yaplist/widgets/bottom/category_picker_modal.dart';
import 'package:yaplist/widgets/bottom/date_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/dropdown_field.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';
import 'package:yaplist/models/category.dart';

class TaskManagerScreen extends StatefulWidget {
  final Task? task;
  final Category? defaultCategory;
  const TaskManagerScreen({super.key, this.task, this.defaultCategory});

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
  TaskPriority selectedPriority = TaskPriority.medium;
  bool _haveTask = false;
  Task? task;

  @override
  void initState() {
    task = widget.task;
    titleController = TextEditingController(text: task?.title);
    dateController =
        TextEditingController(text: DateHelper.formatDate(task?.date));
    categoryController = TextEditingController(
        text: widget.defaultCategory?.name ?? task?.category?.name);
    super.initState();
    selectedCategory =
        selectedCategory = widget.defaultCategory ?? task?.category;
    selectedDate = task?.date;
    selectedPriority = task?.priority ?? TaskPriority.medium;
    _haveTask = task != null;
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

  void onPriorityChanged(CompletedDropdownModel? newPriority) {
    selectedPriority = TaskPriority.values.firstWhere(
        (priority) => priority.name == newPriority?.data,
        orElse: () => TaskPriority.medium);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("task"),
      actions: [
        if (_haveTask)
          IconButton(
              onPressed: () {
                TaskManager.deleteTask(context: context, task: task!);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_forever))
      ],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
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
                DropdownField(
                  label: tr("priority"),
                  items: Constants.priorityDropdownModelList,
                  onChanged: onPriorityChanged,
                  value: Constants.priorityDropdownModelList.firstWhere(
                      (model) => model.data == selectedPriority.name,
                      orElse: () => Constants.priorityDropdownModelList
                          .firstWhere((model) => model.data == "medium")),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(4),
                  child: MasterButton(
                    label: _haveTask ? tr("update") : tr("add"),
                    icon: Icons.calendar_month,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (!_haveTask) {
                          TaskManager.addTask(
                              context: context,
                              title: titleController.text,
                              category: selectedCategory,
                              date: selectedDate,
                              priority: selectedPriority);
                        } else {
                          task!.title = titleController.text;
                          task!.category = selectedCategory;
                          task!.date = selectedDate;
                          task!.priority = selectedPriority;

                          TaskManager.updateTask(
                            context: context,
                            task: task!,
                          );
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
      ),
    );
  }
}
