import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final ValueChanged<dynamic>? onChanged;

  const DropdownField({
    super.key,
    required this.label,
    this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: <String>['A', 'B', 'C', 'D'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Column(
            children: [
              const Icon(Icons.earbuds),
              Text(value),
            ],
          ),
        );
      }).toList(),
      // items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
      ),
    );
  }
}
