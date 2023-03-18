// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yaplist/models/task.dart';

// part 'todo_event.dart';
// part 'todo_state.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   TodoBloc() : super(const TodoInitial(taskList: [])) {
//     on<AddTask>(onAddTask);
//     on<UpdateTask>(onUpdateTask);
//     on<DeleteTask>(onDeleteTask);
//   }

//   void onAddTask(AddTask event, Emitter<TodoState> emit) {
//     List<Task> newTaskList = List.from(state.taskList);
//     newTaskList.add(event.task);
//     emit(
//       TodoChanged(taskList: newTaskList),
//     );
//   }

//   void onUpdateTask(UpdateTask event, Emitter<TodoState> emit) {
//     List<Task> newTaskList = List.from(state.taskList);
//     newTaskList.remove(event.task);
//     newTaskList.add(event.task);

//     // int index =
//     //     newTaskList.indexWhere((element) => element.id == event.task.id);

//     // newTaskList[index] == event.task;
//     emit(
//       TodoChanged(taskList: newTaskList),
//     );
//   }

//   void onDeleteTask(DeleteTask event, Emitter<TodoState> emit) {
//     List<Task> newTaskList = List.from(state.taskList);
//     newTaskList.remove(event.task);
//     emit(
//       TodoChanged(taskList: newTaskList),
//     );
//   }
// }
