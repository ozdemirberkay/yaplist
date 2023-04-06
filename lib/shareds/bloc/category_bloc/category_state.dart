part of 'category_bloc.dart';

@immutable
abstract class CategoryState {
  final List<Category> categoryList;
  const CategoryState({this.categoryList = const []});
}

class CategoryInitial extends CategoryState {
  const CategoryInitial({required List<Category> categoryList})
      : super(categoryList: categoryList);
}

class CategoryChanged extends CategoryState {
  const CategoryChanged({required List<Category> categoryList})
      : super(categoryList: categoryList);
}
