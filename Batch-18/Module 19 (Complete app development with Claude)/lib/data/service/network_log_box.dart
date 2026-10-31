import 'dart:convert';

/// Builds the boxed request / response text printed to the debug console.
///
/// Layout (same idea as the `pretty_dio_logger` package):
///
///     ╔╣ Request ║ GET
///     ║  https://...
///     ╚════════════
///     ╔ Headers
///     ║  accept: application/json
///     ╚════════════
class NetworkLogBox {
  static const int _width = 80;
  static const int _maxBodyLines = 300;

  static String request(String method, Uri uri, Map<String, String>? headers) {
    final headerLines = (headers == null || headers.isEmpty)
        ? ['  (none)']
        : headers.entries.map((e) => '  ${e.key}: ${e.value}').toList();

    return [
      _section('╣ Request ║ $method', ['  $uri']),
      _section(' Headers', headerLines),
    ].join('\n');
  }

  static String response({
    required String method,
    required Uri? uri,
    required int statusCode,
    required String? reason,
    required int elapsedMs,
    required String body,
  }) {
    final status = reason == null || reason.isEmpty ? '$statusCode' : '$statusCode $reason';

    return [
      _section('╣ Response ║ $method ║ Status: $status ║ Time: $elapsedMs ms', ['  $uri']),
      _section(' Body', ['', ..._bodyLines(body)]),
    ].join('\n');
  }

  static String error(String method, Uri uri, String message, int elapsedMs) {
    return _section('╣ Error ║ $method ║ Time: $elapsedMs ms', ['  $uri', '  $message']);
  }

  static List<String> _bodyLines(String body) {
    String text;
    try {
      text = const JsonEncoder.withIndent('   ').convert(jsonDecode(body));
    } catch (_) {
      text = body;
    }
    final lines = text.split('\n').map((l) => '   $l').toList();
    if (lines.length <= _maxBodyLines) return lines;

    return [...lines.take(_maxBodyLines), '   ... (${lines.length - _maxBodyLines} more lines)'];
  }

  static String _section(String title, List<String> lines) {
    return ['╔$title', ...lines.map((l) => '║$l'), '╚${'═' * _width}'].join('\n');
  }
}
