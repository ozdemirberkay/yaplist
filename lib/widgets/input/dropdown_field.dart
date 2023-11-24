import 'package:flutter/material.dart';
import 'package:yaplist/models/filter/dropdown_model.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final CompletedDropdownModel? value;
  final ValueChanged<CompletedDropdownModel?> onChanged;
  final List<CompletedDropdownModel> items;

  const DropdownField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.items,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        items: items.map((CompletedDropdownModel value) {
          return DropdownMenuItem<CompletedDropdownModel>(
            value: value,
            child: Text(value.title),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
        ),
        hint: value != null
            ? Text(
                value!.title,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : null);
  }
}
