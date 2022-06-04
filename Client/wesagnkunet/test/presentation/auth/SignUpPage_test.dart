import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/presentation/auth/SignUpPage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: SignUpPage()));
    //expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.byType(TextButton), findsOneWidget);
    //expect(find.byType(Form), findsNWidgets(1));
    //expect(find.byType(TextFormField), findsNWidgets(2));
    await tester.tap(find.byType(TextButton));
  });
}
