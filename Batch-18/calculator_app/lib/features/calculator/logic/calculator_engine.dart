import '../../../core/app_strings.dart';

/// Pure calculator state machine — no Flutter imports, easy to test.
class CalculatorEngine {
  String _current = '0';
  double? _stored;
  String? _operator;
  bool _justEvaluated = false;
  bool _error = false;
  String _history = '';
  String _expression = '';
  bool _awaitingOperand = false;

  String get display => _current;
  String get expression => _expression;

  void press(String key) {
    if (_error && key != AppStrings.clear) return;
    switch (key) {
      case AppStrings.clear:
        _reset();
      case AppStrings.backspace:
        _backspace();
      case AppStrings.negate:
        _negate();
      case AppStrings.percent:
        _percent();
      case AppStrings.decimal:
        _decimal();
      case AppStrings.add:
      case AppStrings.subtract:
      case AppStrings.multiply:
      case AppStrings.divide:
        _setOperator(key);
      case AppStrings.equals:
        _equals();
      default:
        _digit(key);
    }
  }

  void _reset() {
    _current = '0';
    _stored = null;
    _operator = null;
    _justEvaluated = false;
    _error = false;
    _history = '';
    _expression = '';
    _awaitingOperand = false;
  }

  void _digit(String d) {
    if (_awaitingOperand) {
      _current = '0';
      _awaitingOperand = false;
    }
    if (_justEvaluated) {
      _current = '0';
      _expression = '';
      _justEvaluated = false;
    }
    if (_current.replaceAll(RegExp(r'[-.]'), '').length >= 12) return;
    _current = _current == '0' ? d : '$_current$d';
  }

  void _decimal() {
    if (_awaitingOperand) {
      _current = '0';
      _awaitingOperand = false;
    }
    if (_justEvaluated) {
      _current = '0';
      _expression = '';
      _justEvaluated = false;
    }
    if (!_current.contains('.')) _current = '$_current.';
  }

  void _backspace() {
    if (_justEvaluated) return;
    _current =
        _current.length <= 1 ||
            (_current.length == 2 && _current.startsWith('-'))
        ? '0'
        : _current.substring(0, _current.length - 1);
  }

  void _negate() {
    if (_current == '0') return;
    _current = _current.startsWith('-') ? _current.substring(1) : '-$_current';
  }

  void _percent() {
    final value = double.parse(_current) / 100;
    _current = _format(value);
  }

  void _setOperator(String op) {
    if (_awaitingOperand && _history.isNotEmpty) {
      _operator = op;
      _history = '${_history.substring(0, _history.length - 2)}$op ';
      _expression = _history.trim();
      return;
    }
    if (_justEvaluated) _history = '';
    final entered = _current;
    if (_operator != null && !_justEvaluated) {
      _compute();
      if (_error) return;
    }
    _stored = double.parse(_current);
    _operator = op;
    _justEvaluated = false;
    _history = '$_history$entered $op ';
    _expression = _history.trim();
    _current = _format(_stored!);
    _awaitingOperand = true;
  }

  void _equals() {
    if (_operator == null || _stored == null || _awaitingOperand) return;
    final full = '$_history$_current'.trim();
    _compute();
    if (_error) return;
    _expression = full;
    _history = '';
    _operator = null;
    _stored = null;
    _justEvaluated = true;
  }

  void _compute() {
    final a = _stored!;
    final b = double.parse(_current);
    double result;
    switch (_operator) {
      case AppStrings.add:
        result = a + b;
      case AppStrings.subtract:
        result = a - b;
      case AppStrings.multiply:
        result = a * b;
      case AppStrings.divide:
        if (b == 0) {
          _fail();
          return;
        }
        result = a / b;
      default:
        return;
    }
    _current = _format(result);
    _stored = result;
  }

  void _fail() {
    _error = true;
    _current = AppStrings.errorText;
    _stored = null;
    _operator = null;
    _history = '';
    _expression = '';
  }

  String _format(double v) {
    if (v.isNaN || v.isInfinite) return AppStrings.errorText;
    if (v == v.truncateToDouble() && v.abs() < 1e12) {
      return v.toInt().toString();
    }
    var s = v.toStringAsPrecision(10);
    if (s.contains('e')) return v.toStringAsExponential(5);
    if (s.contains('.')) {
      s = s.replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
    }
    return s;
  }
}
