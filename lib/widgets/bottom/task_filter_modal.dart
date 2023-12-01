import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';
import 'package:yaplist/models/filter/task_filter.dart';
import 'package:yaplist/shareds/ads/ads_manager.dart';
import 'package:yaplist/utilities/date/date_helper.dart';
import 'package:yaplist/widgets/bottom/category_picker_modal.dart';
import 'package:yaplist/widgets/bottom/date_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/dropdown_field.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class TaskFilterModal extends StatefulWidget {
  final Function(TaskFilter?) onFilterChanged;
  final TaskFilter? taskFilter;
  const TaskFilterModal(
      {super.key, required this.onFilterChanged, required this.taskFilter});

  static void show(
      {required BuildContext context,
      required Function(TaskFilter?) onFilterChanged,
      required TaskFilter? taskFilter}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return TaskFilterModal(
            onFilterChanged: onFilterChanged,
            taskFilter: taskFilter,
          );
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
  CompletedDropdownModel? completedDropdownModel;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.taskFilter?.name);
    dateController = TextEditingController(
        text: DateHelper.formatDate(widget.taskFilter?.dateTime));
    categoryController =
        TextEditingController(text: widget.taskFilter?.category?.name);
    selectedCategory = selectedCategory = widget.taskFilter?.category;
    selectedDate = widget.taskFilter?.dateTime;
    completedDropdownModel = widget.taskFilter?.completedDropdownModel;
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

  List<CompletedDropdownModel> dropdownModelList = [
    CompletedDropdownModel(title: tr("all"), data: null),
    CompletedDropdownModel(title: tr("incomplete"), data: false),
    CompletedDropdownModel(title: tr("completed"), data: true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ModalLabel(label: tr("filters")),
                  const SizedBox(height: 6),
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
                    label: tr("status"),
                    items: dropdownModelList,
                    onChanged: (CompletedDropdownModel? value) {
                      completedDropdownModel = value;
                    },
                    value: completedDropdownModel,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MasterButton(
                          label: tr("reset"),
                          onPressed: () {
                            widget.onFilterChanged(null);
                            Navigator.of(context).pop();
                          },
                          icon: Icons.clear),
                      const SizedBox(width: 10),
                      MasterButton(
                          label: tr("apply"),
                          onPressed: () {
                            widget.onFilterChanged(TaskFilter(
                                category: selectedCategory,
                                completedDropdownModel: completedDropdownModel,
                                dateTime: selectedDate,
                                name: titleController.text));
                            Navigator.of(context).pop();
                          },
                          icon: Icons.check),
                    ],
                  ),
                  const SizedBox(height: 6),
                  BannerAdManager.instance.loadAndShowAd(),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
