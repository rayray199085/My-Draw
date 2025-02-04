// Mocks generated by Mockito 5.4.5 from annotations
// in my_draw/test/features/screens/draw/draw_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDrawState_0 extends _i1.SmartFake implements _i2.DrawState {
  _FakeDrawState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DrawCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockDrawCubit extends _i1.Mock implements _i2.DrawCubit {
  MockDrawCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DrawState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeDrawState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.DrawState);

  @override
  _i3.Stream<_i2.DrawState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.DrawState>.empty(),
      ) as _i3.Stream<_i2.DrawState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void loadTicketNumbers(List<int>? numbers) => super.noSuchMethod(
        Invocation.method(
          #loadTicketNumbers,
          [numbers],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void drawBalls() => super.noSuchMethod(
        Invocation.method(
          #drawBalls,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  void emit(_i2.DrawState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i4.Change<_i2.DrawState>? change) => super.noSuchMethod(
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
}
