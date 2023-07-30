import 'package:construction_company/ui/widgets/info_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('InfoCard Visible', (widgetTester) async {
    const thumbnail = MaterialApp(
      home: Scaffold(
        body: InfoCard(
          children: [],
        ),
      ),
    );
    await widgetTester.pumpWidget(thumbnail);

    expect(find.byType(Card), findsOneWidget);
  });
}
