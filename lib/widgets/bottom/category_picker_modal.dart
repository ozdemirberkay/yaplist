import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/widgets/builder/empty/empty_category_builder.dart';
import 'package:yaplist/widgets/card/category_card.dart';
import 'package:yaplist/widgets/text/modal_label.dart';

class CategoryPickerModal extends StatelessWidget {
  final Function(Category) onCategorySelected;
  const CategoryPickerModal({super.key, required this.onCategorySelected});

  static void show(
      {required BuildContext context,
      required Function(Category) onCategorySelected}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CategoryPickerModal(
            onCategorySelected: onCategorySelected,
          );
        });
  }

  void setSelectedCategory(Category selectedCategory, BuildContext context) {
    onCategorySelected(selectedCategory);
    Navigator.of(context).pop();
  }

  Widget renderPickCategory(
      List<Category> categoryList, ScrollController scrollController) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: categoryList.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
              onCategorySelected: (selectedCategory) {
                setSelectedCategory(selectedCategory, context);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        List<Category> categoryList = state.categoryList;
        return SafeArea(
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            expand: false,
            builder: (context, scrollController) {
              return Column(
                children: [
                  ModalLabel(label: tr("chooseCategory")),
                  categoryList.isEmpty
                      ? const EmptyCategoryBuilder()
                      : renderPickCategory(categoryList, scrollController),
                  const SizedBox(height: 6),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
