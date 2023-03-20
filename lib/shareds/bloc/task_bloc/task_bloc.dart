import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
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
    newTaskList.remove(event.task);
    newTaskList.add(event.task);

    // int index =
    //     newTaskList.indexWhere((element) => element.id == event.task.id);

    // newTaskList[index] == event.task;
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
}
