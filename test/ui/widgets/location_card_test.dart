import 'package:construction_company/ui/widgets/location_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LocationCard Visible', (widgetTester) async {
    const thumbnail = MaterialApp(
      home: Scaffold(
        body: LocationCard(),
      ),
    );
    const location = '20041075 | TAP-NS TAP-North Strathfield';
    await widgetTester.pumpWidget(thumbnail);

    expect(find.text(location), findsOneWidget);
  });
}
