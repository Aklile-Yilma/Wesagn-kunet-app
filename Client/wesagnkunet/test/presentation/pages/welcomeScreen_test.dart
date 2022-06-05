import 'package:wesagnkunet/presentation/pages/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomePage()));

    expect(find.byType(Stack), findsNWidgets(1));
    // expect(find.byType(Container), findsNWidgets(8));
    // expect(find.byType(Column), findsNWidgets(4));
    // expect(find.byType(SizedBox), findsNWidgets(2));
  });
}
