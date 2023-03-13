import 'package:yaplist/models/category.dart';

class Task {
  final int id;
  String title;
  bool isCompleted;
  final DateTime? date;
  final Category? category;

  Task(
      {required this.id,
      required this.title,
      required this.isCompleted,
      this.date,
      this.category});
}
