// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewDiaryModel _$NewDiaryModelFromJson(Map<String, dynamic> json) =>
    NewDiaryModel(
      location: json['location'] as String,
      includeInGallery: json['includeInGallery'] as bool,
      comments: json['comments'] as String,
      date: DateTime.parse(json['date'] as String),
      area: json['area'] as String,
      taskCategory: json['taskCategory'] as String,
      tags: json['tags'] as String,
      linkToExistingEvent: json['linkToExistingEvent'] as bool,
      event: json['event'] as String,
    );

Map<String, dynamic> _$NewDiaryModelToJson(NewDiaryModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'includeInGallery': instance.includeInGallery,
      'comments': instance.comments,
      'date': instance.date.toIso8601String(),
      'area': instance.area,
      'taskCategory': instance.taskCategory,
      'tags': instance.tags,
      'linkToExistingEvent': instance.linkToExistingEvent,
      'event': instance.event,
    };
