import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color? fillColor;
  final int maxLines;

  const InputField(
      {super.key,
      required this.label,
      this.controller,
      this.icon,
      this.validator,
      this.onChanged,
      this.keyboardType,
      this.onTap,
      this.readOnly = false,
      this.fillColor,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
        fillColor: fillColor,
      ),
    );
  }
}
