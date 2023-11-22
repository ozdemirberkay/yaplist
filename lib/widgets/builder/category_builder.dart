import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/widgets/card/category_box.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        List<Category> categoryList = state.categoryList;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            // TODO empty kısmını ve gridview düzenle
            return Container(
              margin: const EdgeInsets.only(left: 6),
              child: CategoryBox(
                category: categoryList[index],
              ),
            );
          },
        );
      },
    );
  }
}
