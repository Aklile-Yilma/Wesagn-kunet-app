import 'package:wesagnkunet/presentation/Forms/MarriageForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MarriageForm()));
    expect(find.byType(Form), findsNWidgets(1));
    expect(find.byType(ElevatedButton), findsNWidgets(1));
    expect(find.byType(Text), findsNWidgets(10));
    expect(find.byType(TextFormField), findsNWidgets(6));
  });
}
