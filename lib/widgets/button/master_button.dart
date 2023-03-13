import 'package:flutter/material.dart';

class MasterButtonIcon extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final bool loading;
  final bool disabled;
  final bool isUppercase;

  const MasterButtonIcon({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.loading = false,
    this.disabled = false,
    this.isUppercase = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: disabled || loading ? null : onPressed,
      icon: SizedBox(
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.pink),
              )
            : Icon(
                icon,
                color: Colors.pink,
              ),
      ),
      label: Text(
        isUppercase ? label.toUpperCase() : label,
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
