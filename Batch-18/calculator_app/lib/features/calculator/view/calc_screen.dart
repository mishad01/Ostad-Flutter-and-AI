import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../logic/calculator_engine.dart';
import '../widgets/calc_button.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final _engine = CalculatorEngine();

  static const _rows = <List<String>>[
    [
      AppStrings.clear,
      AppStrings.negate,
      AppStrings.percent,
      AppStrings.divide,
    ],
    ['7', '8', '9', AppStrings.multiply],
    ['4', '5', '6', AppStrings.subtract],
    ['1', '2', '3', AppStrings.add],
    ['0', AppStrings.decimal, AppStrings.backspace, AppStrings.equals],
  ];

  static const _operators = {
    AppStrings.divide,
    AppStrings.multiply,
    AppStrings.subtract,
    AppStrings.add,
  };
  static const _functions = {
    AppStrings.clear,
    AppStrings.negate,
    AppStrings.percent,
  };

  void _onKey(String key) => setState(() => _engine.press(key));

  CalcButton _buildKey(String key, bool dark) {
    final text = dark ? AppColors.darkText : AppColors.lightText;
    Color bg;
    Color fg;
    Color? border;
    var bold = false;
    if (key == AppStrings.equals) {
      bg = AppColors.accent;
      fg = AppColors.accentText;
      bold = true;
    } else if (_operators.contains(key)) {
      bg = dark ? AppColors.darkOperator : AppColors.lightOperator;
      fg = dark ? AppColors.darkOperatorText : AppColors.lightOperatorText;
      bold = true;
    } else if (_functions.contains(key)) {
      bg = dark ? AppColors.darkFunction : AppColors.lightFunction;
      fg = text;
    } else {
      bg = dark ? AppColors.darkKey : AppColors.lightKey;
      fg = text;
      border = dark ? null : AppColors.lightKeyBorder;
    }
    return CalcButton(
      label: key,
      background: bg,
      foreground: fg,
      borderColor: border,
      bold: bold,
      onTap: () => _onKey(key),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final text = dark ? AppColors.darkText : AppColors.lightText;

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _engine.expression,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 22,
                      color: text.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _engine.display,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                      color: text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 12),
            child: Column(
              children: [
                for (final row in _rows)
                  Expanded(
                    child: Row(
                      children: [
                        for (final key in row)
                          Expanded(child: _buildKey(key, dark)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
