
part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class DeleteTask extends TaskEvent {
  final Task task;
  DeleteTask({required this.task});
}

class AddTask extends TaskEvent {
  final Task task;
  AddTask({required this.task});
}

class UpdateTask extends TaskEvent {
  final Task task;
  UpdateTask({required this.task});
}
