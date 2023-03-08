import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';

class Task {
  final int id;
  final String title;
  final String? content;
  bool isCompleted;
  final DateTime? date;
  final Color? color;
  final Category? category;

  Task(
      {required this.id,
      required this.title,
      this.content,
      required this.isCompleted,
      this.date,
      this.color,
      this.category});
}
