import 'dart:io';

import 'package:construction_company/models/new_diary_model.dart';
import 'package:construction_company/repositories/upload_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.MultipartRequest])
void main() {
  late UploadDataRepository repository;
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
  File file = File('assets/image.png');

  setUp(() {
    repository = UploadDataRepository();
  });

  group('createNewDiary', () {
    test('success Creation', () async {
      final response = await repository.createNewDiary(data);
      expect(response.statusCode, 201);
    });
    test('Creation using file', () async {
      final response = await repository.createNewDiary(data, images: [file]);
      expect(response.statusCode, 400);
    });
  });
}
