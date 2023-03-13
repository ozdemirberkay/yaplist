import 'package:flutter/material.dart';

class MasterButtonIcon extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final bool loading;
  final bool disabled;
  final Color borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool isUppercase;

  const MasterButtonIcon({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.loading = false,
    this.disabled = false,
    this.isUppercase = true,
    required this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: disabled || loading ? null : onPressed,
      icon: SizedBox(
        child: loading
            ? SizedBox(
                height: 20,
                width: 20,
                child:
                    CircularProgressIndicator(strokeWidth: 2, color: iconColor),
              )
            : Icon(
                icon,
                color: iconColor,
              ),
      ),
      label: Text(
        isUppercase ? label.toUpperCase() : label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(width: 1, color: borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
