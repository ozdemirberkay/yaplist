import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/task.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial(taskList: [])) {
    on<AddTask>(onAddTask);
    on<UpdateTask>((event, emit) {});
    on<DeleteTask>((event, emit) {});
  }

  void onAddTask(AddTask event, Emitter<TodoState> emit) {
    List<Task> newTaskList = state.taskList;
    newTaskList.add(event.task);
    emit(
      TodoChanged(
        taskList: newTaskList,
      ),
    );
  }

  void onUpdateTask(AddTask event, Emitter<TodoState> emit) {
    emit(
      TodoChanged(
        taskList: state.taskList..add(event.task),
      ),
    );
  }

  void onDeleteTask(AddTask event, Emitter<TodoState> emit) {
    List<Task> newTaskList = state.taskList;
    newTaskList.remove(event.task);
    emit(
      TodoChanged(
        taskList: state.taskList..add(event.task),
      ),
    );
  }
}
