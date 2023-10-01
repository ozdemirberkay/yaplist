import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yaplist/models/category.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends HydratedBloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryInitial(categoryList: [])) {
    on<AddCategory>(onAddCategory);
    on<UpdateCategory>(onUpdateCategory);
    on<DeleteCategory>(onDeleteCategory);
  }

  void onAddCategory(AddCategory event, Emitter<CategoryState> emit) {
    List<Category> newCategoryList = List.from(state.categoryList);
    newCategoryList.add(event.category);
    emit(CategoryChanged(categoryList: newCategoryList));
  }

  void onUpdateCategory(UpdateCategory event, Emitter<CategoryState> emit) {
    List<Category> newCategoryList = List.from(state.categoryList);
    int index = newCategoryList
        .indexWhere((element) => element.id == event.category.id);
    newCategoryList[index] == event.category;
    emit(CategoryChanged(categoryList: newCategoryList));
  }

  void onDeleteCategory(DeleteCategory event, Emitter<CategoryState> emit) {
    List<Category> newCategoryList = List.from(state.categoryList);
    newCategoryList.remove(event.category);
    emit(CategoryChanged(categoryList: newCategoryList));
  }

  @override
  CategoryState? fromJson(Map<String, dynamic> json) {
    final List<dynamic>? categoriesJson = json['categories'];
    return CategoryChanged(
        categoryList: categoriesJson
                ?.map((category) => Category.fromJson(category))
                .toList() ??
            []);
  }

  @override
  Map<String, dynamic>? toJson(CategoryState state) {
    return {
      "categories":
          state.categoryList.map((category) => category.toJson()).toList()
    };
  }
}
