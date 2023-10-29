import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/shareds/bloc/category_bloc/category_bloc.dart';
import 'package:yaplist/utilities/database_helper.dart';
import 'package:yaplist/widgets/bottom/color_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class CategoryManagerScreen extends StatefulWidget {
  final Category? category;
  const CategoryManagerScreen({super.key, this.category});

  @override
  State<CategoryManagerScreen> createState() => _CategoryManagerScreenState();
}

class _CategoryManagerScreenState extends State<CategoryManagerScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
  }

  void onColorSelected(Color? color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("addCategory"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                InputField(
                  label: tr("categoryName"),
                  controller: nameController,
                  icon: Icons.category,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return tr("pleaseEnterCategoryName");
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputField(
                  label: tr("categoryColor"),
                  onTap: () {
                    ColorPickerModal.show(
                        context: context, onColorSelected: onColorSelected);
                  },
                  readOnly: true,
                  icon: Icons.palette,
                  fillColor: selectedColor,
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(4),
                  child: MasterButton(
                    label: tr("add"),
                    icon: Icons.calendar_month,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Category category = Category(
                            id: DatabaseHelper.generateUniqueId(),
                            name: nameController.text,
                            color: selectedColor);

                        context
                            .read<CategoryBloc>()
                            .add(AddCategory(category: category));
                        Navigator.maybePop(context);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
