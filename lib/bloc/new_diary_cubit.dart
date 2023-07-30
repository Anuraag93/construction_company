import 'dart:io';

import 'package:construction_company/bloc/new_diary_state.dart';
import 'package:construction_company/models/new_diary_model.dart';
import 'package:construction_company/repositories/upload_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDiaryCubit extends Cubit<NewDiaryState> {
  final UploadDataRepository _uploadDataRepository;
  NewDiaryCubit(this._uploadDataRepository) : super(NewDiaryDataEntry());

  void reset() => emit(NewDiaryDataEntry());

  void updateLocation(String location) {
    if (state is NewDiaryDataEntry) {
      final entry = state as NewDiaryDataEntry;
      emit(entry.copyWith(location: location));
    }
  }

  void updateImages(List<File> images) {
    if (state is NewDiaryDataEntry) {
      final entry = state as NewDiaryDataEntry;
      emit(entry.copyWith(images: images));
    }
  }

  Future<void> uploadData(NewDiaryModel data) async {
    if (state is NewDiaryDataEntry) {
      final entry = state as NewDiaryDataEntry;
      try {
        final response = await _uploadDataRepository.createNewDiary(data,
            images: entry.images);
        if (response.statusCode == 201) {
          emit(NewDiarySuccess("Upload was successful"));
        } else {
          emit(entry.copyWith(errorMsg: response.body.toString()));
        }
      } catch (e) {
        emit(entry.copyWith(errorMsg: e.toString()));
      }
    }
  }
}
