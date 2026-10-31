import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'report_card.dart';
import 'report_card_header.dart';

class WaterCard extends StatelessWidget {
  const WaterCard({super.key, required this.cups, required this.goal});

  final int cups;
  final int goal;

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.waterCard,
      padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ReportCardHeader(
              icon: Icons.water_drop_outlined,
              title: AppStrings.water,
              iconColor: AppColors.textPrimary,
              iconBackground: AppColors.waterIconBg,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: SizedBox(
              height: 58,
              width: double.infinity,
              child: CustomPaint(
                painter: _WaterWavePainter(level: (cups / goal).clamp(0, 1)),
                child: Center(
                  child: Text(
                    '$cups/$goal ${AppStrings.cupsUnit}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaterWavePainter extends CustomPainter {
  const _WaterWavePainter({required this.level});

  final double level;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.surface);

    final waterTop = size.height * (1 - level);
    final wave = Path()
      ..moveTo(0, waterTop + 4)
      ..cubicTo(
        size.width * 0.3,
        waterTop + 16,
        size.width * 0.6,
        waterTop - 8,
        size.width,
        waterTop,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(wave, Paint()..color = AppColors.water);
  }

  @override
  bool shouldRepaint(covariant _WaterWavePainter oldDelegate) =>
      oldDelegate.level != level;
}
