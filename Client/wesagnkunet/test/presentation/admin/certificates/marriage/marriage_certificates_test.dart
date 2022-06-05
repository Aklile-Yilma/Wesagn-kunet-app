import 'package:wesagnkunet/presentation/admin/certificates/marriage/marriage_certificates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MarriageCertificates()));
    expect(find.byType(Form), findsNothing);
    expect(find.byType(Text), findsNWidgets(8));
    expect(find.byType(ListView), findsOneWidget);
  });
}
