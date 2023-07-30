import 'package:construction_company/ui/screens/new_diary/new_diary_constants.dart';
import 'package:construction_company/ui/widgets/diary_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DiaryTitle Visible', (widgetTester) async {
    const thumbnail = MaterialApp(
      home: Scaffold(
        body: DiaryTitle(),
      ),
    );
    await widgetTester.pumpWidget(thumbnail);

    expect(find.text(NewDiaryConstants.title), findsOneWidget);
    expect(find.byType(Tooltip), findsOneWidget);
  });
}
