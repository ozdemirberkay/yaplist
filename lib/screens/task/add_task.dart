import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';
import 'package:yaplist/shareds/bloc/task_bloc/task_bloc.dart';
import 'package:yaplist/utilities/database_helper.dart';
import 'package:yaplist/widgets/bottom/category_picker_modal.dart';
import 'package:yaplist/widgets/bottom/date_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';
import 'package:yaplist/models/category.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController categoryController;
  DateTime? selectedDate;
  Category? selectedCategory;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.task?.title);
    dateController = TextEditingController(text: formatDate(widget.task?.date));
    categoryController =
        TextEditingController(text: widget.task?.category?.name);
    super.initState();
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

  void onDateChanged(DateTime newDate) {
    dateController.text = formatDate(newDate);
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
                  label: tr("add"),
                  icon: Icons.calendar_month,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Task task = Task(
                        id: DatabaseHelper.generateUniqueId(),
                        title: titleController.text,
                        category: selectedCategory,
                        date: selectedDate,
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
