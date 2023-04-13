part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class DeleteCategory extends CategoryEvent {
  final Category category;
  DeleteCategory({required this.category});
}

class AddCategory extends CategoryEvent {
  final Category category;
  AddCategory({required this.category});
}

class UpdateCategory extends CategoryEvent {
  final Category category;
  UpdateCategory({required this.category});
}
