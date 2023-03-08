import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  const InputField(
      {super.key,
      required this.label,
      this.controller,
      this.icon,
      this.validator,
      this.onChanged,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        labelText: label,
        errorStyle: const TextStyle(height: 0.7),
        suffixIcon: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}
