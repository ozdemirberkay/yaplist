part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class CompleteTask extends TodoEvent {}

class DeleteTask extends TodoEvent {}

class AddTask extends TodoEvent {}

class UpdateTask extends TodoEvent {}
