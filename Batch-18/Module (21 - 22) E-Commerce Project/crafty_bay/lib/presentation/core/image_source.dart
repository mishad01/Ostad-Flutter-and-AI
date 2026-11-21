import 'package:flutter/widgets.dart';

/// Network image for `http(s)` paths, asset image otherwise.
ImageProvider imageProviderFor(String path) {
  return path.startsWith('http') ? NetworkImage(path) : AssetImage(path);
}
