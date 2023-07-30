import 'dart:convert';

import 'package:construction_company/models/new_diary_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const json =
      '''{"location":"location","includeInGallery":true,"comments":"comments","date":"2021-09-01T00:00:00.000Z","area":"area","taskCategory":"taskCategory","tags":"tags","linkToExistingEvent":true,"event":"event"}''';
  final model = NewDiaryModel(
    location: 'location',
    includeInGallery: true,
    comments: 'comments',
    date: DateTime.parse('2021-09-01T00:00:00.000Z'),
    area: 'area',
    taskCategory: 'taskCategory',
    tags: 'tags',
    linkToExistingEvent: true,
    event: 'event',
  );

  test('decode json', () {
    expect(NewDiaryModel.fromJson(jsonDecode(json)), model);
  });

  test('encode json', () {
    expect(jsonEncode(model.toJson()), json);
  });
}
