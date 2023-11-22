import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/utilities/date/date_helper.dart';
import 'package:yaplist/widgets/bottom/category_picker_modal.dart';
import 'package:yaplist/widgets/bottom/date_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class TaskFilterModal extends StatefulWidget {
  const TaskFilterModal({super.key});

  static void show({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const TaskFilterModal();
        });
  }

  @override
  State<TaskFilterModal> createState() => _TaskFilterModalState();
}

class _TaskFilterModalState extends State<TaskFilterModal> {
  TextEditingController dateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  late TextEditingController categoryController = TextEditingController();
  DateTime? selectedDate;
  Category? selectedCategory;

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
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        expand: false,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ModalLabel(label: tr("filters")),
                const SizedBox(height: 6),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: MasterButton(
                      label: tr("select"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.check),
                ),
                const SizedBox(height: 6),
              ],
            ),
          );
        },
      ),
    );
  }
}
