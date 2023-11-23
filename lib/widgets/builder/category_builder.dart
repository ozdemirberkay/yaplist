import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/widgets/builder/empty/empty_category_builder.dart';
import 'package:yaplist/widgets/card/category_box.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        List<Category> categoryList = state.categoryList;

        if (categoryList.isEmpty) {
          return const EmptyCategoryBuilder();
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: categoryList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // TODO gridview düzenle
            return CategoryBox(
              category: categoryList[index],
            );
          },
        );
      },
    );
  }
}
