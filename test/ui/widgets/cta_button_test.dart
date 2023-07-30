import 'package:construction_company/ui/widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CTAButton Visible', (widgetTester) async {
    const btn = MaterialApp(
      home: Scaffold(
        body: CTAButton(text: 'Test'),
      ),
    );
    await widgetTester.pumpWidget(btn);
    expect(find.text('Test'), findsOneWidget);

    final btnFinder =
        widgetTester.widget(find.byType(ElevatedButton)) as ElevatedButton;

    expect(btnFinder.enabled, false);
  });

  testWidgets('CTAButton is enabled when onPressed is passed',
      (widgetTester) async {
    final btn = MaterialApp(
      home: Scaffold(
        body: CTAButton(
          text: 'Test',
          onPressed: () {},
        ),
      ),
    );
    await widgetTester.pumpWidget(btn);

    expect(find.byWidget(btn), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);

    final btnFinder =
        widgetTester.widget(find.byType(ElevatedButton)) as ElevatedButton;

    expect(btnFinder.enabled, true);
  });
}
