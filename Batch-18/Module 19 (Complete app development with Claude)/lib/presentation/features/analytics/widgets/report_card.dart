import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.color,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.hasBorder = false,
  });

  final Color color;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        border: hasBorder ? Border.all(color: AppColors.border) : null,
      ),
      child: child,
    );
  }
}
