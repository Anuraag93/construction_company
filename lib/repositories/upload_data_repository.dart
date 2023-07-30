import 'dart:io';

import 'package:construction_company/models/new_diary_model.dart';
import 'package:http/http.dart' as http;

class UploadDataRepository {
  Future<http.Response> createNewDiary(NewDiaryModel data,
      {List<File>? images}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://reqres.in/api/diaries'),
    );
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });
    request.fields.addAll({
      'includeInGallery': data.includeInGallery.toString(),
      'comments': data.comments,
      'date': data.date.toString(),
      'area': data.area,
      'taskCategory': data.taskCategory,
      'tags': data.tags.toString(),
      'linkToExistingEvent': data.linkToExistingEvent.toString(),
      'event': data.event,
      'location': data.location,
    });
    if (images != null) {
      for (var i = 0; i < images.length; i++) {
        request.files.add(
          http.MultipartFile.fromBytes('images', images[i].readAsBytesSync(),
              filename: images[i].path.split('/').last),
        );
      }
    }
    final response = await request.send();
    return response.statusCode == 201
        ? http.Response('Upload was successful', 201)
        : http.Response('Upload failed', 400);
  }
}
