import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic>? toJson(TodoState state) {}
}
