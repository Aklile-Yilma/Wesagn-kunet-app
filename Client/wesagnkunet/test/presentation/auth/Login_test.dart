import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/presentation/auth/Login.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));
    expect(find.text('LogIn'), findsOneWidget);
    //expect(find.text('Sign Up'), findsOneWidget);
    expect(find.byType(Form), findsNWidgets(1));
    expect(find.byType(TextFormField), findsNWidgets(2));
    await tester.tap(find.byType(ElevatedButton));
  });
}
