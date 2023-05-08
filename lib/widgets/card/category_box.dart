import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/screens/home/tasks.dart';
import 'package:yaplist/shareds/constants/constants.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Tasks(filterCategory: category),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: Constants.borderRadius,
        ),
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          category.name,
        ),
      ),
    );
  }
}
