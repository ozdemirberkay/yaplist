import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/widgets/button/master_button.dart';
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return Text(categoryList[index].name);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: MasterButton(
                        label: tr("confirm"),
                        onPressed: () {
                          onCategorySelected(categoryList[0]);
                          Navigator.of(context).pop();
                        },
                        icon: Icons.check),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
