import 'package:construction_company/bloc/new_diary_cubit.dart';
import 'package:construction_company/bloc/new_diary_state.dart';
import 'package:construction_company/ui/screens/new_diary/new_diary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'new_diary_screen_test.mocks.dart';

@GenerateMocks([NewDiaryCubit])
void main() {
  late NewDiaryCubit mockCubit;
  late Widget view;

  setUpAll(() {
    mockCubit = MockNewDiaryCubit();
    view = BlocProvider<NewDiaryCubit>(
      create: (_) => mockCubit,
      child: const MaterialApp(
        home: NewDiaryScreen(),
      ),
    );
  });

  testWidgets('NewDiaryScreen is visible', (WidgetTester tester) async {
    final state = NewDiaryDataEntry();
    when(mockCubit.stream).thenAnswer((_) => Stream.value(state));
    when(mockCubit.state).thenReturn(state);

    await tester.pumpWidget(view);
    expect(find.text('New Diary'), findsOneWidget);
  });
}
