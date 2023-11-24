import 'package:flutter/material.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final ValueChanged<DropdownModel?>? onChanged;
  final List<DropdownModel> items;

  const DropdownField({
    super.key,
    required this.label,
    this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items.map((DropdownModel value) {
        return DropdownMenuItem<DropdownModel>(
          value: value,
          child: Text(value.title),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
