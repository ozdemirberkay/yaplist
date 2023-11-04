import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/task.dart';

class TaskFilter {
  final Category? category;
  final bool? completed;
  final String? name;
  final DateTime? dateTime;

  TaskFilter({this.category, this.completed, this.name, this.dateTime});
}

mixin TaskFilterMixin {
  List<Task> filteredTaskList(
      {required List<Task> taskList, required TaskFilter filter}) {
    return taskList.where((task) {
      if (filter.category != null && task.category != filter.category) {
        return false;
      }

      if (filter.completed != null && task.isCompleted != filter.completed) {
        return false;
      }

      if (filter.name != null &&
          !task.title.toLowerCase().contains(filter.name!.toLowerCase())) {
        return false;
      }

      if (filter.dateTime != null && task.date != filter.dateTime) {
        return false;
      }

      return true;
    }).toList();
  }
}
