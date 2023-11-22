import 'package:flutter/material.dart';

class MasterIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final bool loading;
  final bool disabled;

  const MasterIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.loading = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled || loading ? null : onPressed,
      child: SizedBox(
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator.adaptive(strokeWidth: 2),
              )
            : Icon(icon),
      ),
    );
  }
}
