import 'package:yaplist/models/category.dart';
import 'package:yaplist/models/priority.dart';

class Task {
  final String id;
  String title;
  bool isCompleted;
  DateTime? date;
  Category? category;
  TaskPriority priority;

  Task(
      {required this.id,
      required this.title,
      this.isCompleted = false,
      this.date,
      this.category,
      this.priority = TaskPriority.medium});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'date': date?.toIso8601String(),
      'category': category?.toJson(),
      'priority': priority.key,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      priority: json['priority'] != null
          ? TaskPriorityExtension.fromKey(json['priority'])
          : TaskPriority.medium,
    );
  }
}
