// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
<<<<<<< HEAD
// utility in the flutter_test package. For example, you can send tap and scroll
=======
// utility that Flutter provides. For example, you can send tap and scroll
>>>>>>> ba6483b2f459633f488ad2a1e7f2e7aaf3eadcab
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

<<<<<<< HEAD
import 'package:calculator_app_flutter/main.dart';
=======
import 'package:calculator_app/main.dart';
>>>>>>> ba6483b2f459633f488ad2a1e7f2e7aaf3eadcab

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
<<<<<<< HEAD
    await tester.pumpWidget(const MyApp());
=======
    await tester.pumpWidget(MyApp());
>>>>>>> ba6483b2f459633f488ad2a1e7f2e7aaf3eadcab

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
