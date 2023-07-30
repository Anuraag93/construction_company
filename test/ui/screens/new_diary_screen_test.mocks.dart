// Mocks generated by Mockito 5.4.2 from annotations
// in construction_company/test/ui/screens/new_diary_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:io' as _i5;

import 'package:construction_company/bloc/new_diary_cubit.dart' as _i3;
import 'package:construction_company/bloc/new_diary_state.dart' as _i2;
import 'package:construction_company/models/new_diary_model.dart' as _i6;
import 'package:flutter_bloc/flutter_bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNewDiaryState_0 extends _i1.SmartFake implements _i2.NewDiaryState {
  _FakeNewDiaryState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NewDiaryCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewDiaryCubit extends _i1.Mock implements _i3.NewDiaryCubit {
  MockNewDiaryCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NewDiaryState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeNewDiaryState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.NewDiaryState);
  @override
  _i4.Stream<_i2.NewDiaryState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i2.NewDiaryState>.empty(),
      ) as _i4.Stream<_i2.NewDiaryState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void reset() => super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void updateLocation(String? location) => super.noSuchMethod(
        Invocation.method(
          #updateLocation,
          [location],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void updateImages(List<_i5.File>? images) => super.noSuchMethod(
        Invocation.method(
          #updateImages,
          [images],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> uploadData(_i6.NewDiaryModel? data) => (super.noSuchMethod(
        Invocation.method(
          #uploadData,
          [data],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void emit(_i2.NewDiaryState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onChange(_i7.Change<_i2.NewDiaryState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
