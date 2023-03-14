import 'package:yaplist/models/category.dart';

class Task {
  final int id;
  String title;
  bool isCompleted;
  DateTime? date;
  final Category? category;

  Task(
      {required this.id,
      required this.title,
      this.isCompleted = false,
      this.date,
      this.category});
}
