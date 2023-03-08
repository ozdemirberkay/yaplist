import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yaplist/widgets/input/input_field.dart';
import 'package:yaplist/widgets/layout/layout.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: tr("addTask"),
      body: Column(
        children: const [
          InputField(label: "Deneme123"),
          SizedBox(height: 20),
          InputField(label: "Deneme123"),
        ],
      ),
    );
  }
}
