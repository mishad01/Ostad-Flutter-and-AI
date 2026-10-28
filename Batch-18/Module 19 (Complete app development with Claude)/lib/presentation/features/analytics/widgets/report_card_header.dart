import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class ReportCardHeader extends StatelessWidget {
  const ReportCardHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.iconBackground,
    this.titleColor = AppColors.textPrimary,
  });

  final IconData icon;
  final String title;
  final Color iconColor;
  final Color iconBackground;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: iconBackground, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: titleColor),
          ),
        ),
      ],
    );
  }
}
