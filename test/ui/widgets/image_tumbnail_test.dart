import 'dart:io';

import 'package:construction_company/ui/widgets/image_tumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ImageThumbnail Visible', (widgetTester) async {
    final thumbnail = MaterialApp(
      home: Scaffold(
        body: ImageThumbnail(
          image: File('assets/images/placeholder.png'),
          onDelete: () {},
        ),
      ),
    );
    await widgetTester.pumpWidget(thumbnail);

    expect(find.byType(Image), findsOneWidget);
  });
}
