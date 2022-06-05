import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:wesagnkunet/presentation/pages/HomePage.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.byTooltip("Home"), findsOneWidget);
    expect(find.byTooltip("Settings"), findsOneWidget);
    expect(find.byTooltip("My Certificates"), findsOneWidget);
    // //expect(find.byType(Form), findsNWidgets(1));
    // // expect(find.byKey(testkey), findsOneWidget);
    // expect(find.byType(Text), findsNWidgets(8));
    // // expect(find.byType(TextFormField), findsNWidgets(4));
    // expect(find.byType(ElevatedButton), findsNWidgets(2));
  });

  // testWidgets('', (WidgetTester tester) async {
  //   const testkey = Key("");
  //   await tester.pumpWidget(MaterialApp(key: testkey, home: HomePage()));

  //   await tester.tap(find.byKey(testkey));
  // });
}
