import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;
  final Color? borderColor;
  final bool bold;
  final VoidCallback onTap;

  const CalcButton({
    super.key,
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
    this.borderColor,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: borderColor == null
          ? BorderSide.none
          : BorderSide(color: borderColor!),
    );
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: background,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 28,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
                color: foreground,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
