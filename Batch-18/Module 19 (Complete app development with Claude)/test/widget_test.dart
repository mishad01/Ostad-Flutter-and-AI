import 'package:flutter_test/flutter_test.dart';

import 'package:minimal_calorie_tracking/core/app_strings.dart';
import 'package:minimal_calorie_tracking/main.dart';

void main() {
  testWidgets('Splash page shows title and actions', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.createAccount), findsOneWidget);
    expect(find.text(AppStrings.logIn), findsOneWidget);
  });
}
