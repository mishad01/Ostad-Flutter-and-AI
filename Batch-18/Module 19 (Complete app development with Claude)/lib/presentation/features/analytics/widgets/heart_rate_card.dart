import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';
import 'report_card.dart';
import 'report_card_header.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key, required this.bpm});

  final int bpm;

  static const _waveHeights = [
    0.3,
    0.6,
    0.45,
    0.8,
    1.0,
    0.7,
    0.2,
    0.35,
    0.5,
    0.3,
    0.6,
    0.8,
    0.75,
    0.9,
    1.0,
    0.55,
    0.7,
    0.6,
    0.75,
    0.8,
    0.6,
    0.85,
    0.5,
    0.3,
    0.15,
  ];

  @override
  Widget build(BuildContext context) {
    return ReportCard(
      color: AppColors.heartCard,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(6, 6, 6, 16),
            child: ReportCardHeader(
              icon: Icons.monitor_heart_outlined,
              title: AppStrings.heartRate,
              iconColor: AppColors.heartWave,
              iconBackground: AppColors.heartIconBg,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 8),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _waveHeights
                          .map(
                            (height) => FractionallySizedBox(
                              heightFactor: height,
                              child: Container(
                                width: 3,
                                decoration: BoxDecoration(
                                  color: AppColors.heartWave,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$bpm ${AppStrings.bpmUnit}',
                      style: const TextStyle(fontSize: 11, color: AppColors.textPrimary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
