import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/card/category_card.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        // List<Category> categoryList = state.categoryList;
        List<Category> categoryList = [];

        categoryList.add(Category(1, name: "Deneme", color: Colors.pink));
        categoryList.add(Category(2, name: "Okul", color: Colors.cyan));
        categoryList
            .add(Category(3, name: "Kurs Taskları", color: Colors.green));
        categoryList.add(Category(3,
            name: "Bi ara yaparım bu taskların hepsini", color: Colors.yellow));

        return Layout(
          title: "Yaplist",
          body: SizedBox(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  child: CategoryCard(
                    category: categoryList[index],
                  ),
                );
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
        );
      },
    );
  }
}
