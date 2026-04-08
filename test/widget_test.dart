import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('basic smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Budge Buddy')),
        ),
      ),
    );

    expect(find.text('Budge Buddy'), findsOneWidget);
  });
}
