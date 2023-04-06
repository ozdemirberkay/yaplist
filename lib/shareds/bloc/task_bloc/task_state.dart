part of 'task_bloc.dart';

@immutable
abstract class TaskState {
  final List<Task> taskList;
  const TaskState({this.taskList = const <Task>[]});
}

class TaskInitial extends TaskState {
  const TaskInitial({required List<Task> taskList}) : super(taskList: taskList);
}

class TaskChanged extends TaskState {
  const TaskChanged({required List<Task> taskList}) : super(taskList: taskList);
}
