import 'package:bloc_test/bloc_test.dart';
import 'package:construction_company/bloc/new_diary_cubit.dart';
import 'package:construction_company/bloc/new_diary_state.dart';
import 'package:construction_company/models/new_diary_model.dart';
import 'package:construction_company/repositories/upload_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'new_diary_cubit_test.mocks.dart';

@GenerateMocks([UploadDataRepository])
void main() {
  late MockUploadDataRepository repository;
  final data = NewDiaryModel(
    includeInGallery: true,
    comments: "Test",
    date: DateTime.now(),
    area: "Test",
    taskCategory: "Test",
    tags: "Test",
    linkToExistingEvent: true,
    event: "Test",
    location: "Test",
  );
  setUp(() {
    repository = MockUploadDataRepository();
  });

  blocTest<NewDiaryCubit, NewDiaryState>(
    'emits [NewDiarySuccess] when successful',
    build: () {
      when(repository.createNewDiary(data)).thenAnswer(
        (_) async => http.Response('Upload was successful', 201),
      );
      return NewDiaryCubit(repository);
    },
    act: (cubit) => cubit.uploadData(data),
    expect: () => [
      NewDiarySuccess("Upload was successful"),
    ],
  );
}
