import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/constants/constants.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function(Category) onCategorySelected;
  const CategoryCard(
      {super.key, required this.onCategorySelected, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCategorySelected(category),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: category.color ?? Theme.of(context).primaryColor,
          borderRadius: Constants.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
