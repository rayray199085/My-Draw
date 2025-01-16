// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketState {
  List<int> get selectedNumbers => throw _privateConstructorUsedError;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketStateCopyWith<TicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
          TicketState value, $Res Function(TicketState) then) =
      _$TicketStateCopyWithImpl<$Res, TicketState>;
  @useResult
  $Res call({List<int> selectedNumbers});
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNumbers = null,
  }) {
    return _then(_value.copyWith(
      selectedNumbers: null == selectedNumbers
          ? _value.selectedNumbers
          : selectedNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketStateImplCopyWith<$Res>
    implements $TicketStateCopyWith<$Res> {
  factory _$$TicketStateImplCopyWith(
          _$TicketStateImpl value, $Res Function(_$TicketStateImpl) then) =
      __$$TicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> selectedNumbers});
}

/// @nodoc
class __$$TicketStateImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateImpl>
    implements _$$TicketStateImplCopyWith<$Res> {
  __$$TicketStateImplCopyWithImpl(
      _$TicketStateImpl _value, $Res Function(_$TicketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNumbers = null,
  }) {
    return _then(_$TicketStateImpl(
      selectedNumbers: null == selectedNumbers
          ? _value._selectedNumbers
          : selectedNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$TicketStateImpl implements _TicketState {
  const _$TicketStateImpl({required final List<int> selectedNumbers})
      : _selectedNumbers = selectedNumbers;

  final List<int> _selectedNumbers;
  @override
  List<int> get selectedNumbers {
    if (_selectedNumbers is EqualUnmodifiableListView) return _selectedNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedNumbers);
  }

  @override
  String toString() {
    return 'TicketState(selectedNumbers: $selectedNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedNumbers, _selectedNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedNumbers));

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      __$$TicketStateImplCopyWithImpl<_$TicketStateImpl>(this, _$identity);
}

abstract class _TicketState implements TicketState {
  const factory _TicketState({required final List<int> selectedNumbers}) =
      _$TicketStateImpl;

  @override
  List<int> get selectedNumbers;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
