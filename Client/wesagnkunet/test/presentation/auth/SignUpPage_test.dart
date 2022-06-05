import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/presentation/auth/SignUpPage.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    const testkey = Key("SignupButton");
    await tester.pumpWidget(MaterialApp(key: testkey, home: SignUpPage()));
    expect(find.byType(Form), findsNWidgets(1));
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(9));
    expect(find.text('SIGN UP'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(6));
    expect(find.byKey(testkey), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(11));
  });

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

  // testWidgets('Counter increments smoke test', (tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(SignUpPage());

  //   final listFinder = find.byType(Scrollable);
  //   final itemFinder = find.byType(TextButton);

  //   // Scroll until the item to be found appears.
  //   await tester.scrollUntilVisible(
  //     itemFinder,
  //     500.0,
  //     scrollable: listFinder,
  //   );

  //   // Verify that the item contains the correct text.
  //   expect(itemFinder, findsOneWidget);
  // });
}
