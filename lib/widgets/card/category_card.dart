import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/screens/home/tasks.dart';
import 'package:yaplist/shareds/constants/constants.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Tasks(filterCategory: widget.category),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.category.color,
          borderRadius: Constants.borderRadius,
        ),
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          widget.category.name,
        ),
      ),
    );
  }
}
