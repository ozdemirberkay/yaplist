import 'package:flutter/material.dart';
import 'package:yaplist/shareds/theme/appcolors.dart';

enum TaskPriority { high, medium, low }

extension TaskPriorityExtension on TaskPriority {
  String get key {
    switch (this) {
      case TaskPriority.high:
        return 'high';
      case TaskPriority.medium:
        return 'medium';
      case TaskPriority.low:
        return 'low';
    }
  }

  int get order {
    switch (this) {
      case TaskPriority.high:
        return 0;
      case TaskPriority.medium:
        return 1;
      case TaskPriority.low:
        return 2;
    }
  }

  IconData get icon {
    switch (this) {
      case TaskPriority.high:
        return Icons.keyboard_double_arrow_up;
      case TaskPriority.medium:
        return Icons.remove;
      case TaskPriority.low:
        return Icons.keyboard_double_arrow_down;
    }
  }

  Color get color {
    switch (this) {
      case TaskPriority.high:
        return AppColors.redColor;
      case TaskPriority.medium:
        return AppColors.greyColor;
      case TaskPriority.low:
        return AppColors.blueColor;
    }
  }

  static TaskPriority fromKey(String key) {
    switch (key) {
      case 'high':
        return TaskPriority.high;
      case 'medium':
        return TaskPriority.medium;
      case 'low':
        return TaskPriority.low;
      default:
        return TaskPriority.medium;
    }
  }
}
