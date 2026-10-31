import 'package:flutter/material.dart';

import '../../../../core/app_strings.dart';

class WorkoutRoundsHeader extends StatelessWidget {
  const WorkoutRoundsHeader({
    super.key,
    required this.current,
    required this.total,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          AppStrings.rounds,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text.rich(
          TextSpan(
            style: const TextStyle(color: Colors.white),
            children: [
              TextSpan(text: '$current', style: const TextStyle(fontSize: 18)),
              TextSpan(text: '/$total', style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}
