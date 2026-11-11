import 'package:flutter/material.dart';

/// Presentation-only category used by category tiles until the API is wired.
class CategoryUiModel {
  const CategoryUiModel({required this.name, required this.icon});

  final String name;
  final IconData icon;
}
