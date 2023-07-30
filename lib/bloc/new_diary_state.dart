import 'dart:io';
import 'package:equatable/equatable.dart';

class NewDiaryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewDiaryDataEntry extends NewDiaryState {
  final List<File>? images;
  final bool includeInGallery;
  final String comments;
  final DateTime? date;
  final String area;
  final String taskCategory;
  final List<String> tags;

  final bool linkToExistingEvent;
  final String event;

  final String errorMsg;
  final String location;

  NewDiaryDataEntry({
    this.images,
    this.includeInGallery = true,
    this.comments = '',
    this.date,
    this.area = '',
    this.taskCategory = '',
    this.tags = const [],
    this.linkToExistingEvent = true,
    this.event = '',
    this.errorMsg = '',
    this.location = '',
  });

  NewDiaryDataEntry copyWith({
    List<File>? images,
    bool? includeInGallery,
    String? comments,
    DateTime? date,
    String? area,
    String? taskCategory,
    List<String>? tags,
    bool? linkToExistingEvent,
    String? event,
    String? errorMsg,
    String? location,
  }) {
    return NewDiaryDataEntry(
      images: images ?? this.images,
      includeInGallery: includeInGallery ?? this.includeInGallery,
      comments: comments ?? this.comments,
      date: date ?? this.date,
      area: area ?? this.area,
      taskCategory: taskCategory ?? this.taskCategory,
      tags: tags ?? this.tags,
      linkToExistingEvent: linkToExistingEvent ?? this.linkToExistingEvent,
      event: event ?? this.event,
      errorMsg: errorMsg ?? this.errorMsg,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [
        images,
        includeInGallery,
        comments,
        date,
        area,
        taskCategory,
        tags,
        linkToExistingEvent,
        event,
        errorMsg,
      ];
}

class NewDiaryDataUploading extends NewDiaryState {}

class NewDiarySuccess extends NewDiaryState {
  final String message;

  NewDiarySuccess(this.message);

  @override
  List<Object?> get props => [message];
}
