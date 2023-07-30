import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_diary_model.g.dart';

@JsonSerializable()
class NewDiaryModel extends Equatable {
  final String location;
  final bool includeInGallery;
  final String comments;
  final DateTime date;
  final String area;
  final String taskCategory;
  final String tags;

  final bool linkToExistingEvent;
  final String event;

  const NewDiaryModel({
    required this.location,
    required this.includeInGallery,
    required this.comments,
    required this.date,
    required this.area,
    required this.taskCategory,
    required this.tags,
    required this.linkToExistingEvent,
    required this.event,
  });

  factory NewDiaryModel.fromJson(Map<String, dynamic> json) =>
      _$NewDiaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewDiaryModelToJson(this);

  @override
  List<Object?> get props => [
        location,
        includeInGallery,
        comments,
        date,
        area,
        taskCategory,
        tags,
        linkToExistingEvent,
        event,
      ];
}
