import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';
import 'package:yaplist/models/task.dart';

class TaskFilter {
  final Category? category;
  final CompletedDropdownModel? completedDropdownModel;
  final String? name;
  final DateTime? dateTime;
  final CompletedDropdownModel? priorityDropdownModel;

  TaskFilter(
      {this.category,
      this.completedDropdownModel,
      this.name,
      this.dateTime,
      this.priorityDropdownModel});
}

mixin TaskFilterMixin {
  List<Task> filteredTaskList(
      {required List<Task> taskList, required TaskFilter filter}) {
    return taskList.where((task) {
      if (filter.category != null && task.category?.id != filter.category?.id) {
        return false;
      }

      if (filter.completedDropdownModel?.data != null) {
        if (filter.completedDropdownModel!.data == "incomplete" &&
            task.isCompleted) {
          return false;
        }
        if (filter.completedDropdownModel!.data == "completed" &&
            !task.isCompleted) {
          return false;
        }
      }

      if (filter.name != null &&
          filter.name!.isNotEmpty &&
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

      if (filter.priorityDropdownModel?.data != null) {
        if (filter.priorityDropdownModel!.data == "low" &&
            task.priority.name != "low") {
          return false;
        }
        if (filter.priorityDropdownModel!.data == "medium" &&
            task.priority.name != "medium") {
          return false;
        }
        if (filter.priorityDropdownModel!.data == "high" &&
            task.priority.name != "high") {
          return false;
        }
      }

      return true;
    }).toList();
  }

  List<Task> pendingMaxTenTask({required List<Task> taskList}) {
    final pending = taskList.where((task) => !task.isCompleted).toList();
    return pending.take(10).toList();
  }
}
