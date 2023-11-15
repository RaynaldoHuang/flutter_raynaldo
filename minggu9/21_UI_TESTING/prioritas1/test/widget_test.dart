import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas1/homepage.dart';

void main() {
  testWidgets('Test Submit Button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Tap on "Create New Contact" button.
    await tester.tap(find.text('Create New Contact'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '123456789');

    await tester.tap(find.text('Pick & open file'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pick & open file'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456789'), findsOneWidget);
  });
}
