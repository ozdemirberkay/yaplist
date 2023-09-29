import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function(Category) onCategorySelected;
  const CategoryCard(
      {super.key, required this.onCategorySelected, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCategorySelected(category);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: category.color,
        ),
        child: Text(category.name),
      ),
    );
  }
}
