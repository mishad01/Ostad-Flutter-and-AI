import 'package:flutter/material.dart';

import '../../../core/app_strings.dart';
import 'calc_screen.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Text(
          AppStrings.appName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: const SafeArea(child: CalcScreen()),
    );
  }
}
