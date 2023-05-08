import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/shareds/constants/routes.dart';
import 'package:yaplist/widgets/button/master_icon_button.dart';
import 'package:yaplist/widgets/card/category_box.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        List<Category> categoryList = state.categoryList;

        return Layout(
          title: "Yaplist",
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr("categories")),
                    MasterIconButton(
                      icon: Icons.add,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addCateogry);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: CategoryBox(
                        category: categoryList[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
