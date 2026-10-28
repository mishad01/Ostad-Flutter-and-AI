import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'report_card.dart';
import 'report_card_header.dart';

class CyclingCard extends StatelessWidget {
  const CyclingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.cardDark,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 12, 8, 16),
            child: ReportCardHeader(
              icon: Icons.directions_bike_rounded,
              title: AppStrings.cycling,
              iconColor: AppColors.cardDark,
              iconBackground: AppColors.surface,
              titleColor: AppColors.textOnPrimary,
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const CustomPaint(size: Size.infinite, painter: _RouteMapPainter()),
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteMapPainter extends CustomPainter {
  const _RouteMapPainter();

  // Fractions of the map size, so the map scales with the card.
  static const _columns = [(0.0, 0.14), (0.18, 0.38), (0.42, 0.6), (0.64, 0.78), (0.82, 1.0)];
  static const _rows = [(0.0, 0.26), (0.32, 0.6), (0.66, 1.0)];
  static const _route = [
    Offset(0.02, 0.48),
    Offset(0.16, 0.48),
    Offset(0.16, 0.29),
    Offset(0.62, 0.29),
    Offset(0.62, 0.63),
    Offset(0.4, 0.63),
    Offset(0.4, 0.92),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.mapRoad);

    final blockPaint = Paint()..color = AppColors.mapBlock;
    for (final (left, right) in _columns) {
      for (final (top, bottom) in _rows) {
        canvas.drawRect(
          Rect.fromLTRB(
            left * size.width,
            top * size.height,
            right * size.width,
            bottom * size.height,
          ),
          blockPaint,
        );
      }
    }

    final route = Path()..moveTo(_route.first.dx * size.width, _route.first.dy * size.height);
    for (final point in _route.skip(1)) {
      route.lineTo(point.dx * size.width, point.dy * size.height);
    }
    canvas.drawPath(
      route,
      Paint()
        ..color = AppColors.accent
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _RouteMapPainter oldDelegate) => false;
}
