import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas2/main.dart';

void main() {
  testWidgets('UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Hello, Flutter!'), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });
}
