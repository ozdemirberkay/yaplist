import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';
import 'package:yaplist/models/task.dart';

class TaskFilter {
  final Category? category;
  final CompletedDropdownModel? completedDropdownModel;
  final String? name;
  final DateTime? dateTime;

  TaskFilter(
      {this.category, this.completedDropdownModel, this.name, this.dateTime});
}

mixin TaskFilterMixin {
  List<Task> filteredTaskList(
      {required List<Task> taskList, required TaskFilter filter}) {
    return taskList.where((task) {
      if (filter.category != null && task.category?.id != filter.category?.id) {
        return false;
      }

      if (filter.completedDropdownModel?.data != null &&
          task.isCompleted != filter.completedDropdownModel!.data) {
        return false;
      }

      if (filter.name != null &&
          !task.title.toLowerCase().contains(filter.name!.toLowerCase())) {
        return false;
      }

      if (filter.dateTime != null &&
          task.date != null &&
          (task.date!.year != filter.dateTime!.year ||
              task.date!.month != filter.dateTime!.month ||
              task.date!.day != filter.dateTime!.day)) {
        return false;
      }

      return true;
    }).toList();
  }
}
