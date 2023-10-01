import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yaplist/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskInitial(taskList: [])) {
    on<AddTask>(onAddTask);
    on<UpdateTask>(onUpdateTask);
    on<DeleteTask>(onDeleteTask);
  }

  void onAddTask(AddTask event, Emitter<TaskState> emit) {
    List<Task> newTaskList = List.from(state.taskList);
    newTaskList.add(event.task);
    emit(
      TaskChanged(taskList: newTaskList),
    );
  }

  void onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    List<Task> newTaskList = List.from(state.taskList);
    int index =
        newTaskList.indexWhere((element) => element.id == event.task.id);
    newTaskList[index] == event.task;
    emit(
      TaskChanged(taskList: newTaskList),
    );
  }

  void onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    List<Task> newTaskList = List.from(state.taskList);
    newTaskList.remove(event.task);
    emit(
      TaskChanged(taskList: newTaskList),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    final List<dynamic>? tasksJson = json['tasks'];
    return TaskChanged(
        taskList: tasksJson?.map((task) => Task.fromJson(task)).toList() ?? []);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return {"tasks": state.taskList.map((task) => task.toJson()).toList()};
  }
}
