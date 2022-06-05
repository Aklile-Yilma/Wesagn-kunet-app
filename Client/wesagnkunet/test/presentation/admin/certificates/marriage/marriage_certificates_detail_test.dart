import 'package:wesagnkunet/presentation/admin/certificates/components/bottom_nav.dart';
import 'package:wesagnkunet/presentation/admin/certificates/components/certificate_delete_update.dart';
import 'package:wesagnkunet/presentation/admin/certificates/marriage/marriage_certiificate_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MarriageCertificateDetail()));
    expect(find.byType(Form), findsNothing);
    expect(find.byType(FloatingActionButton), findsNWidgets(1));
    expect(find.byType(CustomeBottomNav), findsOneWidget);
    expect(find.byType(CertificateDeleteUpdateWidget), findsOneWidget);
  });
}
