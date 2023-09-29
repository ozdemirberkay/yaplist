import 'package:flutter/material.dart';

class MasterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final bool loading;
  final bool disabled;

  const MasterButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.loading = false,
    this.disabled = false,
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
                child: CircularProgressIndicator.adaptive(strokeWidth: 2),
              )
            : Icon(icon),
      ),
      label: Text(
        label.toUpperCase(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
