import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  void updateTask(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: const Border.symmetric(
            horizontal: BorderSide(color: Colors.grey),
          )
          // border: Border.all(color: Colors.pink),
          ),
      child: Column(
        children: [
          Text(
            widget.category.name,
          ),
        ],
      ),
    );
  }
}
