import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:minimal_calorie_tracking/main.dart';

void main() {
  testWidgets('App launches', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
