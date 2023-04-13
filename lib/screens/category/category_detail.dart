import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/models/category.dart';
import 'package:yaplist/widgets/bottom/color_picker_modal.dart';
import 'package:yaplist/widgets/button/master_button.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category? category;
  const CategoryDetailScreen({super.key, this.category});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void onColorSelected(Color color) {
    colorController.text = color.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("addCategory"),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4),
                child: MasterButtonIcon(
                  label: tr("add"),
                  icon: Icons.calendar_month,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
